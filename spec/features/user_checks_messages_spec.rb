require 'spec_helper'

feature 'User checks messages', %q{
  As a member,
  I want to check my messages
  So that I can see which members contacted me
} do
  # Acceptance Criteria:
  # * I must go to messages
  # * I must selected Inbox
  scenario 'goes to Inbox', js: true do
    recipient = FactoryGirl.create(:user)
    sender = FactoryGirl.create(:user, first_name: "James", last_name: "Spader", username: "someguy")
    message = FactoryGirl.create(:message, recipient_id: recipient.id, sender_id: sender.id)
    sign_in_fill(recipient)
    click_on 'Sign in'
    visit index_messages_path
    expect(page).to have_content(message.subject)
  end

end
