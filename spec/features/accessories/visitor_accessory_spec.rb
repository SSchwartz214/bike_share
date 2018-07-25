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
    xit "sees the accessory and can add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessory_path(acc_1)

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)

      expect(page).to_not have_content("Add to Cart")

      expect(page).to have_content("Accessory Retired")
    end
  end
end
