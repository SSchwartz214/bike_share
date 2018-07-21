# As a visitor,
# When I visit an accessory show,
# I see an image, title, description and price for my accessory,
# I can click "Add to Cart"

require "rails_helper"

describe "a visitor" do
  describe "visits accessory show" do
    xit "sees the accessory and can add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      visit accessory_show_path(acc_1)

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)

      expect(page).to have_content("Add to Cart")

      click_on "Add to Cart"

      # TODO: check number of items in cart...
    end
  end

  describe "visits retired accessory show" do
    xit "sees the accessory and can add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "90jasd", description: "1209390jioas")

      visit accessory_show_path(acc_1)

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)

      expect(page).to_not have_content("Add to Cart")

      expect(page).to have_content("Accessory Retired")
    end
  end
end
