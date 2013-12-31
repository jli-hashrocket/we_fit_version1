class UserActivity < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :activity

  belongs_to :user,
    inverse_of: :user_activities
  belongs_to :activity,
    inverse_of: :user_activities
end
