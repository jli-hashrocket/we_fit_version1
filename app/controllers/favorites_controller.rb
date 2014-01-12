class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @favorites = Favorite.get_favorites
  end

  def create
    @favorite = current_user.favorites.build(favorited_id: params[:favorited_id])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to 'index', notice: 'Added to Favorites' }
        format.js
        format.json { render action: 'index', status: :created, location: @favorite}
      else
        format.html { render action: 'index', notice: "Cannot add to Favorites" }
        format.js
        format.json { render json: @favorite.errors, status: :unprocessable_entity}

      end
    end
  end

  def destroy
    @favorites = Favorite.all
    current_user.favorites.destroy(params[:id])
    render action: 'index', notice: 'A favorite has been removed.'
  end

end
