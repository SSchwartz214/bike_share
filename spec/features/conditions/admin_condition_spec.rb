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

      expect(current_path).to eq(edit_admin_condition_path(condition_1))
    end

    it "can not see delete or edit buttons if it is not an admin" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      default = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

      visit condition_path(condition_1)

      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end

    it "fills out form to change condition" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      admin = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      date = "08/09/2013"
      max_temp = 100
      mean_temp = 50
      min_temp = 1
      mean_hum = 10
      mean_vis = 20
      wind_spd = 80
      prec = 25

      visit edit_admin_condition_path(condition_1)

      fill_in "condition[date]", with: date
      fill_in "condition[mean_temperature_f]", with: mean_temp
      fill_in "condition[max_temperature_f]", with: max_temp
      fill_in "condition[min_temperature_f]", with: min_temp
      fill_in "condition[mean_humidity]", with: mean_hum
      fill_in "condition[mean_visibility_miles]", with: mean_vis
      fill_in "condition[mean_wind_speed_mph]", with: wind_spd
      fill_in "condition[precipitation_inches]", with: prec

      click_on "Control the weather"

      expect(current_path).to eq(condition_path(condition_1))

      expect(page).to have_content("Weather updated!")

      expect(page).to have_content(max_temp)
      expect(page).to have_content(min_temp)
      expect(page).to have_content(mean_temp)
      expect(page).to have_content(mean_hum)
      expect(page).to have_content(mean_vis)
      expect(page).to have_content(wind_spd)
      expect(page).to have_content(prec)
    end

    it "can click on delete and remove condition" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      admin = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit condition_path(condition_1)

      click_on "Delete"

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content("Weather for 2013-08-29 deleted!")
      expect(Condition.count).to eq(0)
    end

    it "can create a new condition" do
      admin = User.create!(first_name: "keegan", last_name: "c", username: "oijads", password: "oiajsiod", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      date = "08/09/2013"
      max_temp = 100
      mean_temp = 50
      min_temp = 1
      mean_hum = 10
      mean_vis = 20
      wind_spd = 80
      prec = 25

      visit new_admin_condition_path

      fill_in "condition[date]", with: date
      fill_in "condition[mean_temperature_f]", with: mean_temp
      fill_in "condition[max_temperature_f]", with: max_temp
      fill_in "condition[min_temperature_f]", with: min_temp
      fill_in "condition[mean_humidity]", with: mean_hum
      fill_in "condition[mean_visibility_miles]", with: mean_vis
      fill_in "condition[mean_wind_speed_mph]", with: wind_spd
      fill_in "condition[precipitation_inches]", with: prec

      click_on "Create the weather"

      expect(current_path).to eq(condition_path(Condition.first))

      expect(page).to have_content("Weather created!")

      expect(page).to have_content(max_temp)
      expect(page).to have_content(min_temp)
      expect(page).to have_content(mean_temp)
      expect(page).to have_content(mean_hum)
      expect(page).to have_content(mean_vis)
      expect(page).to have_content(wind_spd)
      expect(page).to have_content(prec)
    end
  end
end
