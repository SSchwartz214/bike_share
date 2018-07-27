require "rails_helper"

describe "a visitor" do
  describe "visits accessory show" do
    it "sees the accessory and can add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessory_path(acc_1)

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)

      expect(page).to have_content("Add to Cart")

      click_on "Add to Cart"
    end
  end

  describe "visits retired accessory show" do
    it "sees the accessory and can add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessory_path(acc_1)

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)

      expect(page).to_not have_content("Add to Cart")

      expect(page).to have_content("Accessory Retired")
    end
  end
  describe 'user visits accessory index' do
    it 'displays all accessories' do
      acc_1 = Accessory.create!(name: "aa", price: 12, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      acc_2 = Accessory.create!(name: "bb", price: 13, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      acc_3 = Accessory.create!(name: "cc", price: 23, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessories_path

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.status)
      expect(page).to have_content(acc_2.name)
      expect(page).to have_content(acc_2.price)
      expect(page).to have_content(acc_2.status)
    end
  end
end
