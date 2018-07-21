require "rails_helper"

describe "a visitor" do
  describe "visits /bike-shop" do
    xit "sees a list of accessories" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")
      acc_2 = Accessory.create!(name: "8ad98h", price: 1234, status: 0, image_url: "iads", description: "0ijas0j")

      visit '/bike-shop'

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)
      expect(page).to have_content(acc_2.name)
      expect(page).to have_content(acc_2.price)
      expect(page).to have_content(acc_2.description)
    end

    xit "can click on add to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      visit '/bike-shop'

      click_on "Add to Cart"

      expect(page).to have_content("Added #{acc_1.name} to cart!")
      expect(page).to have_content("Items in cart: 1")
    end
  end
end
