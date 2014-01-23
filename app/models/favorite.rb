class Favorite < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :favorited
  validates_uniqueness_of :favorited_id, scope: :user_id

  belongs_to :user,
    inverse_of: :favorites

  belongs_to :favorited,
    class_name: "User"

end
