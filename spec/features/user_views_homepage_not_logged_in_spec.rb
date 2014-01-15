require 'spec_helper'

feature 'User views homepage, while not logged in', %q{
  As a user,
  I want to view the homepage,
  So I can either log in or sign up
} do

  scenario 'views homepage and sees sign in and sign up, while  not logged in' do
      visit root_path

      expect(page).to have_content("Sign In")
      expect(page).to have_content("Join Us")
  end
end
