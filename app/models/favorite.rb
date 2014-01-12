class Favorite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :favorited_id

  belongs_to :user,
    inverse_of: :favorites
end
