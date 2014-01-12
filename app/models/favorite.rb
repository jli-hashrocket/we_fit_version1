class Favorite < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :favorited_id

  belongs_to :user,
    inverse_of: :favorites

  def self.get_favorites
    # SELECT u.first_name, u.last_name FROM users as u INNER JOIN  favorites as f ON u.id = f.favorited_id;
    User.joins('INNER JOIN favorites ON users.id = favorites.favorited_id')
  end
end
