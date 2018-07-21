require "rails_helper"

describe "a visitor" do
  describe "visits /" do
    xit "can click on login" do
      visit "/"

      click_on "Login"

      expect(current_path).to eq("/login")
    end

    it "can click on create account and fill out a form" do
      first_name = "iajd"
      last_name = "0912j"
      username = "oiasd"
      password = "09j90dj"

      visit "/login"

      click_on "Create Account"

      expect(current_path).to eq(new_user_path)

      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_username, with: username
      fill_in :user_password, with: password

      click_on "Create Account"

      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Logged in as #{username}")
      expect(page).to have_content(first_name)
      expect(page).to have_content(last_name)
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
