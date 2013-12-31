class AddColumnsToUser < ActiveRecord::Migration
  def up
    add_column :users, :last_name, :string, null:false
    add_column :users, :first_name, :string, null:false
    add_column :users, :username, :string, null:false
    add_column :users, :bio, :text
    add_column :users, :photo, :string
    add_column :users, :location, :string
    add_column :users, :preferred_gender, :string
    add_column :users, :activity_id, :integer
  end

  def down
    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :username
    remove_column :users, :bio
    remove_column :users, :photo
    remove_column :users, :location
    remove_column :users, :preferred_gender
    remove_column :users, :activity_id
  end
end
