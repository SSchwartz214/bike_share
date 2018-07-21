require "rails_helper"

describe "a visitor" do
  visits "carts" do
    it "sees a list of accessories added to cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")
      acc_2 = Accessory.create!(name: "8ad98h", price: 1234, status: 0, image_url: "iads", description: "0ijas0j")

      # TODO: we need to manually add these items to the cart
      #add 2 acc_2 to cart to test quantity

      visit "/cart"

      # TODO: verify pictures exist for these items

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)
      expect(page).to have_content(acc_2.name)
      expect(page).to have_content(acc_2.price)
      expect(page).to have_content(acc_2.description)
      expect(page).to have_content("Subtotal: #{acc_2.price * 2}") # TODO: check formatting on the price for this item
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Total: #{(acc_2.price * 2) + acc_1.price}")
    end

    it "can create an account and still visit cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")
      acc_2 = Accessory.create!(name: "8ad98h", price: 1234, status: 0, image_url: "iads", description: "0ijas0j")

      # TODO: we need to manually add these items to the cart
      #add 2 acc_2 to cart to test quantity

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

      click_on "Create Account"

      visit "/cart"

      expect(page).to have_content(acc_1.name)
      expect(page).to have_content(acc_1.price)
      expect(page).to have_content(acc_1.description)
      expect(page).to have_content(acc_2.name)
      expect(page).to have_content(acc_2.price)
      expect(page).to have_content(acc_2.description)
      expect(page).to have_content("Subtotal: #{acc_2.price * 2}") # TODO: check formatting on the price for this item
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Total: #{(acc_2.price * 2) + acc_1.price}")
    end

    it "can remove accessories from cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      visit "/cart"

      click_on "remove"

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Successfully removed #{acc_1.name} from your cart.")
      expect(page).to_not have_content(acc_1.description)

      click_on acc_1.name # flash message contains a link!

      expect(current_path).to eq(accessory_show(acc_1))
    end

    it "can increment item in cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      #TODO: add 1 acc_1 to cart

      visit "/cart"

      find('#increment').click #TODO: adjust name of ID for increment and decrement click

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 2")
    end
    it "can decrement item in cart" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      #TODO: add 1 acc_1 to cart

      visit "/cart"

      expect(page).to have_content("Total: #{(acc_2.price * 2)}")

      find('#decrement').click #TODO: adjust name of ID for increment and decrement click

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Total: 0")
    end

    it "can not check out" do
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "90jasd", description: "1209390jioas")

      #TODO: add 1 acc_1 to cart

      visit "/cart"

      expect(page).to_not have_content("Check Out")
    end
  end
end
