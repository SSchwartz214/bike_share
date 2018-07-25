require 'rails_helper'

describe "User visits trips index page" do
  context "as admin" do
    it "allows admin to see all trips" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      trip = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      expect(page).to have_content("Trips")
    end
  end
  it 'allows admin to edit a trip' do
    admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
    station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
    station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
    trip = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit trips_path(trip)

    click_on 'Edit Trip'

    expect(current_path).to eq(edit_admin_trip_path(trip))
  end

  it 'allows admin to create a trip' do
    admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_trip_path

    fill_in :trip_duration, with: 100
    fill_in :trip_start_date, with: "8/30/2013"
    # select 'MLK Library', from: 'trip[start_station_id]'
    fill_in :trip_end_date, with: "9/01/2013"
    # find('#trip_end_station_id').find(:xpath, "Japantown").select_option
    fill_in :trip_subscription_type, with: "subscribed"
    fill_in :trip_zip_code, with: 12345
    fill_in :trip_bike_id, with: 2

    click_button "Create Trip"

    expect(current_path).to eq(trip_path(Trip.last))
  end
end
