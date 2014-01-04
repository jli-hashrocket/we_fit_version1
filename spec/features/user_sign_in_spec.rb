require 'spec_helper'

feature 'User signs in', %q{
As a registered user,
I want to view my profile
So I can see if my profile is up to date

Acceptance Criteria
*I must sign in
*I must click on 'View Profile'
} do

  scenario 'signed in, should see member home, profile, browse and sign out buttons' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on 'Sign in'
    expect(page).to have_content("Welcome")
    expect(page).to have_content("Profile")
    expect(page).to have_content("Browse")
    expect(page).to have_content("Sign Out")
  end

  scenario 'views own profile page' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on 'Sign in'
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.location)
    expect(page).to have_content(user.gender)
  end

  scenario 'edits profile page' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on 'Sign in'
    click_on 'Edit Profile'
    expect(page).to have_content("Edit Profile")
    fill_in "Location", with: "cambridge, ma"
    fill_in "Current password", with: user.password
    click_on "Update User"
    expect(page).to have_content("WeFit")
  end
end

def sign_in_fill(user)
    visit root_path
    click_on 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
end
