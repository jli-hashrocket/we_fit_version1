class Activity < ActiveRecord::Base
  validates_presence_of :name

  has_many :user_activities,
    inverse_of: :activity
  has_many :users,
    through: :user_activities
end
