class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.integer :user_id, null:false
      t.integer :activity_id, null:false

      t.timestamps
    end
  end
end
