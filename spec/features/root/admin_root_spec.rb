require "rails_helper"

describe "an admin user" do
  describe "visits /" do
    it "can click on login and fill out form" do
      user_1 = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)

      visit root_path

      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in :username, with: user_1.username
      fill_in :password, with: user_1.password

      click_on "Log in"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Logged in as admin: #{user_1.first_name}")
      expect(page).to have_content(user_1.first_name)
      expect(page).to have_content(user_1.last_name)

      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
