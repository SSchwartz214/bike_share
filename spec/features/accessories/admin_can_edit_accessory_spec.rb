require 'rails_helper'

describe 'a user updates an accessory' do
  it 'updates' do
    admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    visit edit_admin_accessory_path(acc_1)

    fill_in :accessory_name, with: "broomstick"

    click_on "Update Accessory"

    expect(current_path).to eq(accessory_path(acc_1))

    expect(page).to have_content("broomstick")
  end
end
