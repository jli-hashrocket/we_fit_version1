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

  scenario 'sends a message', js: true do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:user, username:"Jacked", email: "jeffsmeels@aol.com")

    sign_in_fill(user)
    click_on "Sign in"
    click_on "Browse Members"

    visit new_messages_path
    select "#{profile.username}", from: "message_recipient_id"
    fill_in "message_subject", with: "Hello"
    fill_in "message_body", with: "We should talk"
    click_on "Send Message"
    expect(page).to have_content("You have sent a message to #{profile.username}!")
  end

end

