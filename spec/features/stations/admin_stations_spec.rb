require 'rails_helper'

describe 'an admin visits a station index' do
  xit 'deletes a station' do
    admin = User.create(first_name: "wefwef", last_name: "Fefwfu", username: "Connor", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
    station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

    visit stations_path

    expect(page).to have_content(station_1.name)

    within("#display_#{station_1.id}") do
      click_on("Delete")
    end


  end
end
