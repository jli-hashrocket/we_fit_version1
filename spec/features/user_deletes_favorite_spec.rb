require 'spec_helper'

feature 'User deletes a favorite', %q{
  As a user,
  I want to delete a favorite,
  So that I no longer have to keep track of the member
} do
  # * I must delete the profile that I no longer want to keep

  scenario 'deletes a favorite', js: true  do
    user = FactoryGirl.create(:user)
    favorite = FactoryGirl.create(:favorite, user: user)
    favorited = favorite.favorited

    sign_in_as(user)
    visit user_favorites_path(user)
    click_on "Remove"
    visit user_favorites_path(user)

    # expect(page).to have_content('Removed from Favorites')
    expect(page).to_not have_content favorited.first_name
  end

  def sign_in_as(user)
    visit new_user_session_path

    within '.new_user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign in'
    end
  end
end
