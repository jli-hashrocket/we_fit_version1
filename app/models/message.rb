class Message < ActiveRecord::Base
  attr_accessible :subject, :body, :sender_id, :recipient_id, :read_at, :sender_deleted, :recipient_deleted
  validates_presence_of :subject, message: "Please enter message title"

  belongs_to :sender,
    class_name: 'User',
    primary_key: 'id',
    foreign_key: 'sender_id'
  belongs_to :recipient,
    class_name: 'User',
    primary_key: 'id',
    foreign_key: 'recipient_id'

  def mark_message_deleted(id, user_id)
    self.sender_deleted = true if self.sender_id == user_id && self.id = id
    self.recipient_deleted = true if self.recipient_id == user_id && self.id=id
    self.sender_deleted && self.recipient_deleted ? self.destroy : save!
  end

end
