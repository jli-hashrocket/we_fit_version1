class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favorited_by_id, null:false
      t.integer :favorited_id, null:false

      t.timestamps
    end
  end
end
