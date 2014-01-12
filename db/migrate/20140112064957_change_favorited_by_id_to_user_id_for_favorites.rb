class ChangeFavoritedByIdToUserIdForFavorites < ActiveRecord::Migration
  def up
    rename_column :favorites, :favorited_by_id, :user_id
  end

  def down
    rename_column :favorites, :user_id, :favorited_by_id
  end
end
