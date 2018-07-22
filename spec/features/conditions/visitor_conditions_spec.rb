require "rails_helper"

describe "a visitor" do
  describe "conditions index" do
<<<<<<< HEAD
    it "can see all conditions and attributes" do
      condition_1 = Condition.create!(end_date: "8/29/2013", max_temperature: 1234, mean_temperature: 511, min_temperature: 123, mean_humididity: 75, mean_visibility: 10, mean_wind_speed: 27, precipitation: 11)
=======

    it "can see all conditions and attributes" do
      condition_1 = Condition.create!(end_date: "8/29/2013", max_temperature: 1234, mean_temperature: 511, min_temperature: 123, mean_humididity: 75, mean_visibility: 10, mean_wind_speed: 27, precipitation: 11)

>>>>>>> f817cc2d91216c87fd36af9c1640ed0794ea2a61

      condition_2 = Condition.create!(end_date: "8/29/2017", max_temperature: 12345, mean_temperature: 5115, min_temperature: 1235, mean_humididity: 755, mean_visibility: 105, mean_wind_speed: 275, precipitation: 115)

      visit conditions_path

      expect(page).to have_content(condition_1.end_date)
      expect(page).to have_content(condition_1.max_temperature)
      expect(page).to have_content(condition_1.mean_temperature)
      expect(page).to have_content(condition_1.min_temperature)
      expect(page).to have_content(condition_1.mean_humididity)
      expect(page).to have_content(condition_1.mean_visibility) #in miles
      expect(page).to have_content(condition_1.mean_wind_speed) # in mph
      expect(page).to have_content(condition_1.precipitation) # in inches

      expect(page).to have_content(condition_2.end_date)
      expect(page).to have_content(condition_2.max_temperature)
      expect(page).to have_content(condition_2.mean_temperature)
      expect(page).to have_content(condition_2.min_temperature)
      expect(page).to have_content(condition_2.mean_humididity)
      expect(page).to have_content(condition_2.mean_visibility)
      expect(page).to have_content(condition_2.mean_wind_speed)
      expect(page).to have_content(condition_2.precipitation)
    end
  end

  describe "conditions show" do
<<<<<<< HEAD
    it "can see all attributes for condition" do
      condition_1 = Condition.create!(end_date: "8/29/2013", max_temperature: 1234, mean_temperature: 511, min_temperature: 123, mean_humididity: 75, mean_visibility: 10, mean_wind_speed: 27, precipitation: 11)
=======

    it "can see all attributes for condition" do
      condition_1 = Condition.create!(end_date: "8/29/2013", max_temperature: 1234, mean_temperature: 511, min_temperature: 123, mean_humididity: 75, mean_visibility: 10, mean_wind_speed: 27, precipitation: 11)

>>>>>>> f817cc2d91216c87fd36af9c1640ed0794ea2a61

      visit condition_path(condition_1)

      expect(page).to have_content(condition_1.end_date)
      expect(page).to have_content(condition_1.max_temperature)
      expect(page).to have_content(condition_1.mean_temperature)
      expect(page).to have_content(condition_1.min_temperature)
      expect(page).to have_content(condition_1.mean_humididity)
      expect(page).to have_content(condition_1.mean_visibility) #in miles
      expect(page).to have_content(condition_1.mean_wind_speed) # in mph
      expect(page).to have_content(condition_1.precipitation) # in inches
    end
  end
end
