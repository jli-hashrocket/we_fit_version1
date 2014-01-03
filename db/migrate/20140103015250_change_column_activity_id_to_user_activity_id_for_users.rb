class ChangeColumnActivityIdToUserActivityIdForUsers < ActiveRecord::Migration
  def up
    rename_column :users, :activity_id, :user_activity_id
  end

  def down
    rename_column :users, :user_activity_id, :activity_id
  end
end
