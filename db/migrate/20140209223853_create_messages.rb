class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.integer :sender_id, null:false
      t.integer :recipient_id
      t.boolean :sender_deleted, default:false
      t.boolean :recipient_deleted, default:false
      t.string :subject, null:false
      t.text :body
      t.datetime :read_at
      t.string :container, default:"draft"

      t.timestamps
    end
  end
  def down
    drop_table :messages
  end
end
