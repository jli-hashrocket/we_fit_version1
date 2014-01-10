class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates_presence_of :gender

  has_many :user_activities,
    inverse_of: :user
  has_many :activities,
    through: :user_activities

  mount_uploader :photo, PhotoUploader

  def send_mail
    if save
      UserConfirmation.member_info(self).deliver
      return true
    end
  end

end
