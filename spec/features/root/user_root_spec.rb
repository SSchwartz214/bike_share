require "rails_helper"

describe "a registered user" do
  describe "visits /" do
    it "can click on login and fill out form" do
      user_1 = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas")

      visit root_path

      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in :sessions_username, with: user_1.username
      fill_in :sessions_password, with: user_1.password

      click_on "Log in"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Logged in as #{user_1.username}")
      expect(page).to have_content(user_1.first_name)
      expect(page).to have_content(user_1.last_name)

      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end

# As a registered user,
# When I visit "/",
# I see a link for "Login",
#
# When I click "Login",
# I should be on the "/login" page,
# I see a place to insert my credentials to login,
# I fill in my desired credentials,
# I submit my information,
# My current page should be "/dashboard",
# I see a message in the navbar that says "Logged in as SOME_USER",
# I see my profile information,
# I do not see a link for "Login",
# I see a link for "Logout".
