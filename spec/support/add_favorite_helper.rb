module AddFavorite
  def add_favorite
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user, username: "PilatesLover")

    visit new_user_session_path

    within ".new_user" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on 'Sign in'
    end

    click_on 'Browse Members'

    page.find("#user_#{user1.id}").trigger("click")
    page.find(".add").trigger("click")
  end
end
