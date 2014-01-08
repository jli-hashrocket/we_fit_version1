
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
    user1 = FactoryGirl.create(:user, username: "PilatesLover")
    user2 = FactoryGirl.create(:user, username: "Lift4Life")
    user3 = FactoryGirl.create(:user, username: "BaseJumper")

    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    page.html.should include("<h1>Browse Members</h1>")
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)
  end

  scenario 'filters with physical activities checked' do
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    check("Jogging")
    check("Weightlifting")
    check("Aerobics")
    check("Zumba")

    click_on "Submit"

    expect(page).to have_content("Jogging")
    expect(page).to have_content("Weightlifting")
    expect(page).to have_content("Aerobics")
    expect(page).to have_content("Zumba")
  end

end

def sign_in_fill(user)
    visit root_path
    click_on 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
end
