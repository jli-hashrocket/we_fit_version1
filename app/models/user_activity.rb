class UserActivity < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :activity

  belongs_to :user
  belongs_to :activity

end
