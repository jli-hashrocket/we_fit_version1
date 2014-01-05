module Signin
  def sign_in_fill(user)
      visit root_path
      click_on 'Sign In'
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
  end
end
