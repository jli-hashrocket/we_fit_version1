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


  mount_uploader :photo, PhotoUploader

  def send_mail
    if save
      UserConfirmation.member_info(self).deliver
      return true
    end
  end

end
