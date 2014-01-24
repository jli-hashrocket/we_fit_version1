require 'spec_helper'

feature 'User signs out', %q{
User Story:
As a member
I want to sign out
So I can exit the member session

Acceptance Criteria:
*I must click the Logout button
*I get redirected to the default home landing page
} do

  scenario 'signs out' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on 'Sign in'

    click_link 'Sign Out'
    expect(page).to have_content('Sign In!')
  end
end
