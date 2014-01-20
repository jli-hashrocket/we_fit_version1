class AddLatitudeLongitudeToUsers < ActiveRecord::Migration
  def up
    add_column :users, :latitude, :float
    add_column :users, :longitute, :float
  end

  def down
    remove_column :users, :latitude
    remove_column :users, :longitute
  end
end
