
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

  scenario "user sees extra member information", js: true do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user, email: "jeffsmeels@aol.com")

    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    page.find("#user_#{other_user.id}").trigger("click")

    expect(page).to have_content "jeffsmeels@aol.com"
  end

  scenario 'search with attributes checked and search fields filled' do
    user = FactoryGirl.create(:user)
    weightlifting = FactoryGirl.create(:activity)
    jogging = FactoryGirl.create(:activity, name: "Jogging")
    user_activity = FactoryGirl.create(:user_activity, user_id: user.id, activity_id: jogging.id)
    user_activity2 = FactoryGirl.create(:user_activity, user_id: user.id, activity_id: weightlifting.id)

    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    fill_in "q_username_cont", with: user.username
    check("male")
    fill_in "q_location_cont", with: user.location
    check(weightlifting.name)
    check(jogging.name)

    click_on "Search"

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.gender)
    expect(page).to have_content(user.location)
    expect(page).to have_content("Jogging")
    expect(page).to have_content("Weightlifting")
  end

end
