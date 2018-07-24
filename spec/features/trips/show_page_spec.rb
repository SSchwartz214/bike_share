require 'rails_helper'
# As an admin user,
# When I visit the trip show,
# I see everything a visitor can see,
# I see a button to delete this trip,
# I also see a button to edit this trip.
# ** All Attributes must be present **
describe 'user visits trip show page' do
  context 'as admin' do
    it 'allows admin to edit a trip' do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      trip = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trip_path(trip)

      click_on 'Edit Trip'

      expect(current_path).to eq(edit_admin_trip_path(trip))
    end
  end
  context 'as a default user' do
    it 'does not allow default user to edit a trip' do
      user = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 0)
      station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
      station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")
      trip = Trip.create!(duration: 123, start_date: DateTime.strptime("8/29/2013 14:13", '%m/%d/%Y %H:%M'), start_station: station_1, end_date: DateTime.strptime("8/29/2013 14:14", '%m/%d/%Y %H:%M'), end_station: station_2, subscription_type: "subscribed", zip_code: 12345, bike_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit trip_path(trip)
      expect(page).to_not have_content("Edit Trip")
    end
  end
end
