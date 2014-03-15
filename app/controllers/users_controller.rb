class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    if params[:within] && (params[:within].to_i > 0)
      @search = User.near(current_user.location, params[:within].to_i).search(params[:q])
    else
      @search = User.search(params[:q])
    end

    @members = @search.result(distinct: true).page(params[:page]).per(10)
    @activities = Activity.all

    @users = @members.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

  def show
    @user = User.find(params[:id])
    @user_activities = @user.activities
  end

  def to_json
    @members = User.all
    render json: @members
  end
end
