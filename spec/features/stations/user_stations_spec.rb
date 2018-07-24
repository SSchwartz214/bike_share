require 'rails_helper'

describe 'dashboard' do
  it 'shows all of the attributes' do
    station_1 = Station.create!(name: "aiojd", dock_count: 8, city: "0912jeioj", installation_date: "8/6/2013")
    station_2 = Station.create!(name: "ajsd0jd", dock_count: 20, city: "09190ajsd0j", installation_date: "8/12/2013")

    visit '/stations-dashboard'

    expect(page).to have_content(Station.count)
    expect(page).to have_content(Station.average_bikes.to_i)
    expect(page).to have_content(Station.most_bikes)
    expect(page).to have_content(Station.most_bikes_station.name)
    expect(page).to have_content(Station.fewest_bikes)
    expect(page).to have_content(Station.fewest_bikes_station.name)
    expect(page).to have_content(Station.newest.name)
    expect(page).to have_content(Station.oldest.name)

  end
end
