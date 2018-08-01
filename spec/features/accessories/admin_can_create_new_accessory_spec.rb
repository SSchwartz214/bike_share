
require 'rails_helper'

describe 'as an admin' do
  describe "visits admin accessory new" do
    it "can create a new accessory" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_new_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: 50
      fill_in :accessory_image_url, with: "https://images-na.ssl-images-amazon.com/images/I/61ZtPYh9jEL._SX425_.jpg"

      click_on "Create Accessory"

      expect(current_path).to eq(accessory_path(Accessory.last))
      expect(page).to have_content("pedals")
    end

    it "has a default image" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_new_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: 50

      click_on "Create Accessory"

      expect(Accessory.first.image_url).to eq("https://upload.wikimedia.org/wikipedia/commons/6/63/French_horn_front.png")
    end

    it "has a default image if an empty string is passed in" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_new_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: 50
      fill_in :accessory_image_url, with: ""

      click_on "Create Accessory"

      expect(Accessory.first.image_url).to eq("https://upload.wikimedia.org/wikipedia/commons/6/63/French_horn_front.png")
    end

    it "has flash messages for incorrect information" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_new_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: -9
      fill_in :accessory_image_url, with: ""

      click_on "Create Accessory"

      expect(page).to have_content("Price must be present and cannot be negative.")
      expect(current_path).to eq(admin_accessories_path)

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: ""
      fill_in :accessory_price, with: 10
      fill_in :accessory_image_url, with: ""

      click_on "Create Accessory"

      expect(page).to have_content("Description must be present")
      expect(current_path).to eq(admin_accessories_path)
    end

    it "can not have the same name as another accessory" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", address: "1 maple st.", city: "Denver", state: "CO", zip_code: 12345, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      acc_1 = Accessory.create!(name: "pedals", description: "oijadois", price: 10)

      visit admin_bike_shop_new_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: 10
      fill_in :accessory_image_url, with: ""

      click_on "Create Accessory"

      expect(page).to have_content("Please choose another name")
      expect(current_path).to eq(admin_accessories_path)
    end
  end
end
