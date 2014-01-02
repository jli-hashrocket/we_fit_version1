class AddGenderToUsers < ActiveRecord::Migration
  def up
    add_column :users, :gender, :string, null:false
  end

  def down
    remove_column :users, :gender
  end
end
