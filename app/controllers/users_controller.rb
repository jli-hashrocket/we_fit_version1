class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index

    @search = User.search(params[:q])
    @members = @search.result.page(params[:page]).per(10)
    @users = User.all
    @activities = Activity.all
  end

  def show
    @user = User.find(params[:id])
    @user_activities = @user.activities
  end

end
