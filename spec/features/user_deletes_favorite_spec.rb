require 'spec_helper'

feature 'User deletes a favorite', %q{
  As a user,
  I want to delete a favorite,
  So that I no longer have to keep track of the member
} do
  # * I must delete the profile that I no longer want to keep

  scenario 'deletes a favorite', js: true do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:user, username: 'PilatesLover')

    visit new_user_session_path

    within '.new_user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign in'
    end

    click_on 'Browse Members'
    page.find("#user_#{profile.id}").trigger('click')
    page.find('.add').trigger('click')
    expect(page).to have_content('Added to Favorites')

    click_on 'Favorites'
    page.find('.remove_profile').trigger('click')
    expect(page).to have_content('Removed from Favorites')
    expect(page).to_not have_content(profile.username)
  end
end
