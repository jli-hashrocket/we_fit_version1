class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:within] && (params[:within].to_i > 0)
      @search = User.near(current_user.location, params[:within].to_i).search(params[:q])
    else
      @search = User.search(params[:q])
    end

    @members = @search.result.page(params[:page]).per(10)
    @users = @members.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end

    @activities = Activity.all
  end

  def show
    @user = User.find(params[:id])
    @user_activities = @user.activities
  end

end
