class FixLongitudeColumnForUsers < ActiveRecord::Migration
  def up
    remove_column :users, :longitute
    add_column :users, :longitude, :float
  end
  def down
    remove_column :users, :longitude
    add_column :users, :longitute, :float
  end
end
