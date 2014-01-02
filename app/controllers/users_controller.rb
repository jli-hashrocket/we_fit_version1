class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :bio, :photo, :location, :gender, :preferred_gender, :activity_id)
    end
end
