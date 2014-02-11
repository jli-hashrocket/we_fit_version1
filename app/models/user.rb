class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_presence_of :gender

  geocoded_by :location
  after_validation :geocode

  has_many :user_activities,
    dependent: :destroy,
    inverse_of: :user

  has_many :activities,
    through: :user_activities,
    dependent: :destroy

  has_many :favorites,
    dependent: :destroy,
    inverse_of: :user

  has_many :favorite_users,
    through: :favorites,
    source: :favorited

  has_many :received_messages,
    class_name: 'Message',
    primary_key: 'id',
    foreign_key: 'recipient_id',
    order: 'messages.created_at DESC',
    conditions: ['messages.recipient_deleted =?', false]


  mount_uploader :photo, PhotoUploader

  def unread_messages?
    unread_message_count > 0 ? true : false
  end

  def unread_message_count
    messages.count(conditions: ['recipient_id = ? AND read_at IS NULL',self.id])
  end

  def send_mail
    if save
      UserConfirmation.member_info(self).deliver
      return true
    end
  end

end
