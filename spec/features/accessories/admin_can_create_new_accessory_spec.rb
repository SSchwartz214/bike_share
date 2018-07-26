require 'rails_helper'

describe 'as an admin' do
  describe "visits admin accessory new" do
    it "can create a new accessory" do
      admin = User.create!(first_name: "Seth", last_name: "S", username: "SS", password: "ss", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_accessories_path

      fill_in :accessory_name, with: "pedals"
      fill_in :accessory_description, with: "Carbon fiber pedals will make you go fast"
      fill_in :accessory_price, with: 50
      fill_in :accessory_image_url, with: "https://images-na.ssl-images-amazon.com/images/I/61ZtPYh9jEL._SX425_.jpg"

      click_on "Create Accessory"

      expect(current_path).to eq(accessories_path(Accessory.last))
      expect(page).to have_content("pedals")
    end
  end
end
