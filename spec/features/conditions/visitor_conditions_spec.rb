require 'time'
require "rails_helper"

describe "a visitor" do
  describe "conditions index" do
    it "can see all conditions and attributes" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      condition_2 = Condition.create!(date: Date.strptime("8/29/2017", '%m/%d/%Y'), max_temperature_f: 12345, mean_temperature_f: 5115, min_temperature_f: 1235, mean_humidity: 755, mean_visibility_miles: 105, mean_wind_speed_mph: 275, precipitation_inches: 115)

      visit conditions_path

      expect(page).to have_content(condition_1.date.to_s.chomp("00:00:00 UTC"))
      expect(page).to have_content(condition_1.max_temperature_f)
      expect(page).to have_content(condition_1.mean_temperature_f)
      expect(page).to have_content(condition_1.min_temperature_f)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility_miles) #in miles
      expect(page).to have_content(condition_1.mean_wind_speed_mph) # in mph
      expect(page).to have_content(condition_1.precipitation_inches) # in inches

      expect(page).to have_content(condition_2.date.to_s.chomp("00:00:00 UTC"))
      expect(page).to have_content(condition_2.max_temperature_f)
      expect(page).to have_content(condition_2.mean_temperature_f)
      expect(page).to have_content(condition_2.min_temperature_f)
      expect(page).to have_content(condition_2.mean_humidity)
      expect(page).to have_content(condition_2.mean_visibility_miles)
      expect(page).to have_content(condition_2.mean_wind_speed_mph)
      expect(page).to have_content(condition_2.precipitation_inches)
    end
  end

  describe "conditions show" do
    it "can see all attributes for condition" do
      condition_1 = Condition.create!(date: Date.strptime("8/29/2013", '%m/%d/%Y'), max_temperature_f: 1234, mean_temperature_f: 511, min_temperature_f: 123, mean_humidity: 75, mean_visibility_miles: 10, mean_wind_speed_mph: 27, precipitation_inches: 11)

      visit condition_path(condition_1)

      expect(page).to have_content(condition_1.date)
      expect(page).to have_content(condition_1.max_temperature_f)
      expect(page).to have_content(condition_1.mean_temperature_f)
      expect(page).to have_content(condition_1.min_temperature_f)
      expect(page).to have_content(condition_1.mean_humidity)
      expect(page).to have_content(condition_1.mean_visibility_miles)
      expect(page).to have_content(condition_1.mean_wind_speed_mph)
      expect(page).to have_content(condition_1.precipitation_inches)
    end
  end
end
