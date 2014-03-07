require 'spec_helper'

feature 'User sends a message', %q{
  As a member,
  I want to send a message to a member,
  So that I can contact the member
} do
  # Acceptance Criteria:
  # * I must choose a member
  # * I must click the button to send message
  # * I must fill the message
  # * I must send the message

  scenario 'chooses a member', js: true do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:user, email: "jeffsmeels@aol.com")

    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    within "#member_user_#{profile.id}" do
      page.find("#user_#{profile.id}").trigger('click')
      page.find('.send_message').trigger('click')
    end
    expect(page).to have_content('You have sent a message to #{profile.username}!')
  end

end

