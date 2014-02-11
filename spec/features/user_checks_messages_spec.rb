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
    user = FactoryGirl.create(:user)
    sign_in_fill(user)
    click_on 'Sign in'

    # page.find('a', text: 'Messages').trigger(:mouseover)
    # click_on 'Inbox'
    # expect(page).to have_content('Inbox')

  end

end
