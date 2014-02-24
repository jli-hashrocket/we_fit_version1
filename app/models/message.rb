class Message < ActiveRecord::Base
  validates_presence_of :subject, message: "Please enter message title"

  belongs_to :sender,
    class_name: 'User',
    primary_key: 'id',
    foreign_key: 'sender_id'
  belongs_to :recipient,
    class_name: 'User',
    primary_key: 'id',
    foreign_key: 'recipient_id'

  # def mark_message_deleted(id, user_id)
  #   self.sender_deleted = true if self.sender_id == user_id && self.id = id
  #   self.recipient_deleted = true if self.recipient_id == user_id && self.id=id
  #   self.sender_deleted && self.recipient_deleted ? self.destroy : save!
  # end

  # def self.reading_message(id, reader)
  #   message = find(id, conditions: ["sender_id = ? OR recipient_id = ?", reader, reader])
  #   if message.read_at.nil? && (message.recipient.id == reader)
  #     message.read_at = Time.now
  #     message.save!
  #   end
  #   message
  # end


  def read?
    self.read_at.nil? ? false : true
  end

end
