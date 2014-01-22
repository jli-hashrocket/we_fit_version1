class Favorite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :favorited_id
  validates_uniqueness_of :favorited, scope: :user

  belongs_to :user,
    inverse_of: :favorites

  belongs_to :favorited,
    class_name: "User"

end
