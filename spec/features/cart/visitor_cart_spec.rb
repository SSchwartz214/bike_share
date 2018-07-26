require "rails_helper"

describe "a visitor" do
  describe "carts" do
    it "can add accessory to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessory_path(acc_1)

      click_on "Add to Cart"

      expect(current_path).to eq(accessory_path(acc_1))
      expect(page).to have_content("1 #{acc_1.name} in your cart")
    end
    it "can see total number of items in navbar" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      visit accessory_path(acc_1)

      expect(page).to_not have_content("Items in cart:")

      click_on "Add to Cart"

      expect(page).to have_content("Items in cart: 1")

      click_on "Add to Cart"

      expect(page).to have_content("Items in cart: 2")
    end

    it "can create an account and still visit cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      acc_2 = Accessory.create!(name: "8ad98h", price: 1234, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "0ijas0j")

      cart = Cart.new(Hash.new(0))
      allow(Cart).to receive(:new).and_return(cart)
      cart.add_accessory(acc_1.id)
      cart.add_accessory(acc_2.id)

      first_name = "iajd"
      last_name = "0912j"
      username = "oiasd"
      password = "09j90dj"

      visit "/cart"

      click_on "Create Account"

      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_username, with: username
      fill_in :user_password, with: password
      within("#new-user") do
        click_on "Create Account"
      end

      visit "/cart"

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_2.name)
    end

    it "can not check out" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      cart = Cart.new(Hash.new(0))
      allow(Cart).to receive(:new).and_return(cart)
      cart.add_accessory(acc_1.id)

      visit "/cart"

      expect(page).to_not have_content("Checkout")
    end

    it "can remove an item" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      cart = Cart.new(Hash.new(0))
      allow(Cart).to receive(:new).and_return(cart)
      cart.add_accessory(acc_1.id)

      visit "/cart"

      expect(page).to have_content(acc_1.name)

      within("#remove_#{acc_1.id}") do
        click_on "Remove"
      end

      expect(current_path).to eq(cart_path)

      expect(page).to_not have_content("name: #{acc_1.name}")
    end
  end
end
