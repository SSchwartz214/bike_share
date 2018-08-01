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

  it "has flash messages for incorrect price" do
    admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    acc_2 = Accessory.create!(name: "oias", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    visit edit_admin_accessory_path(acc_1)

    fill_in :accessory_name, with: "pedals"
    fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
    fill_in :accessory_price, with: -9
    fill_in :accessory_image_url, with: ""

    click_on "Update Accessory"

    expect(page).to have_content("Price must be present and cannot be negative.")
    expect(current_path).to eq(admin_accessory_path(acc_1))
  end

  it "has flash messages for incorrect description" do
    admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    acc_2 = Accessory.create!(name: "oias", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    visit edit_admin_accessory_path(acc_1)

    fill_in :accessory_name, with: "pedals"
    fill_in :accessory_description, with: ""
    fill_in :accessory_price, with: 10
    fill_in :accessory_image_url, with: ""

    click_on "Update Accessory"

    expect(page).to have_content("Description must be present")
    expect(current_path).to eq(admin_accessory_path(acc_1))
  end

  it "can not have the same same name as another accessory" do
    admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
    acc_2 = Accessory.create!(name: "oias", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

    visit edit_admin_accessory_path(acc_1)

    fill_in :accessory_name, with: "oias"
    fill_in :accessory_description, with: "hasd08h"
    fill_in :accessory_price, with: 10
    fill_in :accessory_image_url, with: ""

    click_on "Update Accessory"

    expect(page).to have_content("Please fill out all fields")
    expect(current_path).to eq(admin_accessory_path(acc_1))
  end

  it "replaces image url if url is empty string" do
    image_link = "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg"
    admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: image_link, description: "1209390jioas")

    visit edit_admin_accessory_path(acc_1)

    fill_in :accessory_name, with: "oias"
    fill_in :accessory_description, with: "hasd08h"
    fill_in :accessory_price, with: 10
    fill_in :accessory_image_url, with: ""

    click_on "Update Accessory"

    expect(acc_1.image_url).to eq(image_link)
  end
end
