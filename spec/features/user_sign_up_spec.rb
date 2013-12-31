require 'spec_helper'

feature 'User signs up', %q{
As a guest
I want to register
So I can create a user profile and be a member

Acceptance Criteria:
*I must provide a username
*I must provide a password
*I must confirm my password
*I must provide first name
*I must provide last name
*I must provide email
*I must submit the registration form
*I must confirm from email confirmation to activate membership
} do
  context 'with valid attributes' do
    it 'creates membership' do
      user = FactoryGirl.create(:user)
      visit new_user_registration_path
      click_on 'Sign up'
      expect(page).to have_content('Welcome')
    end
  end


end
