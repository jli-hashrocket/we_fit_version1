require 'spec_helper'

feature 'User signs up', %q{
As a registered user,
I want to view my profile
So I can see if my profile is up to date

Acceptance Criteria
*I must sign in
*I must click on 'View Profile'
} do

  scenario 'signed in, should see member home, profile, browse and sign out buttons' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Sign In'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on 'Sign in'

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Profile")
    expect(page).to have_content("Browse")
    expect(page).to have_content("Sign Out")
  end
end
