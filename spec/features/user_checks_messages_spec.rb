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
    visit inbox_messages_path
    expect(page).to have_content(message.subject)
  end

  scenario 'opens an inbox  message' do
    recipient = FactoryGirl.create(:user)
    sender = FactoryGirl.create(:user, first_name: "James", last_name: "Spader", username: "someguy")
    message = FactoryGirl.create(:message, recipient_id: recipient.id, sender_id: sender.id)
    sign_in_fill(recipient)
    click_on 'Sign in'
    visit inbox_messages_path
    click_link message.subject

    expect(page).to have_content(message.body)
    expect(page).to have_content(message.subject)
    expect(page).to have_content(sender.username)
  end

  scenario 'goes to Sent box', js: true do
    recipient = FactoryGirl.create(:user)
    sender = FactoryGirl.create(:user, first_name: "James", last_name: "Spader", username: "someguy")
    message = FactoryGirl.create(:message, recipient_id: sender.id, sender_id: recipient.id)
    sign_in_fill(recipient)
    click_on 'Sign in'
    visit sent_messages_path
    expect(page).to have_content(message.subject)
  end

  scenario 'opens a sent message' do
    recipient = FactoryGirl.create(:user)
    sender = FactoryGirl.create(:user, first_name: "James", last_name: "Spader", username: "someguy")
    message = FactoryGirl.create(:message, recipient_id: sender.id, sender_id: recipient.id)
    sign_in_fill(recipient)
    click_on 'Sign in'
    visit sent_messages_path
    click_link message.subject

    expect(page).to have_content(message.body)
    expect(page).to have_content(message.subject)
    expect(page).to have_content(recipient.username)
  end

end
