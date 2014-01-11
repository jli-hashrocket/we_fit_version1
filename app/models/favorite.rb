class Favorite < ActiveRecord::Base
  validates_presence_of :favorited_by_id
  validates_presence_of :favorited_id

  belongs_to :favorited_by, class_name: "User",
    inverse_of: :favorites
end
