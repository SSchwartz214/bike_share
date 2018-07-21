require "rails_helper"

describe "a visitor" do
  visits "station index" do
    it "can see all stations and attributes" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

      visit stations_index_path

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)

      expect(page).to have_content(station_2.name)
      expect(page).to have_content(station_2.dock_count)
      expect(page).to have_content(station_2.city)
      expect(page).to have_content(station_2.installation_date)
    end
  end

  visits "station show page" do
    it "can see station attributes and station name in url" do
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")

      visit station_show_path(station_1)

      expect(current_path).to eq("/:#{station_1.name}")

      tation_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)
    end
  end
end
