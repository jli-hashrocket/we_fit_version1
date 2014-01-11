require 'spec_helper'



feature 'User favorites a profile', %q{
  User Story:
  As a user,
  I want to add profile favorites,
  So that I can come back to the profile later
} do
  # Acceptance Criteria:
  # *I must click on the favorite button for the profile I want to keep
  scenario 'clicks on profile to favorite', js: true do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user, username: "PilatesLover")

    visit new_user_session_path

    within ".new_user" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on 'Sign in'
    end

    sleep 10
    click_on 'Browse Members'

    page.find("#user_#{user1.id}").trigger("click")
    expect(page).to
  end

#   scenario 'goes to Favorites' do
#     user = FactoryGirl.create(:user)
#     user1 = FactoryGirl.create(:user, username: "PilatesLover")

#     sign_in_fill(user)
#     click_on 'Sign in'
#     click_on 'Favorites'

#     expect(page).to have_content("Your Favorite Profiles")
#   end

 end
