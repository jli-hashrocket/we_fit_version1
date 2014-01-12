class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @favorites = Favorite.all
  end

  def create
    @user = User.find(params[:user_id])
    @favorite = current_user.favorited.build
    respond_to do |format|
      if @favorite.save
        flash[:notice] = "Added to Favorites"
        format.js
      else
        flash[:alert] = "Cannot add to Favorites"
        format.js
      end
    end
  end

end
