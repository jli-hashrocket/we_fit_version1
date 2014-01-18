class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
     @favorites = current_user.favorites.page(params[:page]).per(10)
     @user = current_user
  end

  def create
    @favorite = current_user.favorites
      .build(favorited_id: params[:favorited_id])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to 'index', notice: 'Added to Favorites' }
        format.js { flash.now[:notice] = 'Added to Favorites!' }
        format.json do
          render action: 'index', status: :created, location: @favorite
        end
      else
        format.html { render action: 'index', notice: 'Cannot add to Favorites' }
        format.js { flash.now[:alert] = 'Could not be added to Favorites!' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity}

      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.favorites.destroy(params[:id])
        format.html { redirect_to user_favorites_path(current_user),notice: 'Removed from Favorites' }
        format.js { flash[:notice] = 'Removed from Favorites' }
        format.json { head :no_content }
      end
    end
  end
end
