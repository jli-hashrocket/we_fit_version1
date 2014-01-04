
require 'spec_helper'

feature 'User browse other members', %q{
User Story:
As a member
I want to browse other members
So I can view their profiles  and send them a message if I'm interested in contacting them

Acceptance Criteria
*I can search members by criteria(i.e. has photo, location, genders, activity
*I can sort members by location, gender, has photo, activity
*I can click on a profile, read their summary, activities that they like
} do

  scenario 'browses members' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    page.html.should include("<h1>Browse Members</h1>")
  end

end

def sign_in_fill(user)
    visit root_path
    click_on 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
end
