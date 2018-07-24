require "rails_helper"


describe "an admin" do
  describe "visits condition show path" do
    it "clicks on delete" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      admin = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit condition_path(condition_1)

      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")

      click_on "Edit"

      expect(current_path).to eq(edit_condition_path(condition_1))
    end
  end
end
