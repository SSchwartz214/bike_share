require "rails_helper"

describe "an admin" do
  describe "on the dashboard" do
    it "clicks on a link for viewing accessories" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      click_on "View Accessories"

      expect(current_path).to eq(admin_bike_shop_path)
    end
  end

  describe "accessories dashboard" do
    it "can see all accessory information" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      expect(page).to have_content(acc_1.name)

      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
      expect(page).to have_content("Deactivate")
    end

    it "can see activate for retired item" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      expect(page).to have_content("Activate")
    end

    it "can change status if activate is clicked on" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      expect(page).to have_content("retired")

      click_on "Activate"

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content("active")
      expect(page).to_not have_content("retired")
    end

    it "can change delete item" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "ijaidjo", password: "j98jdoas", role: 1)
      acc_1 = Accessory.create!(name: "oiad", price: 123, status: 1, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      expect(page).to have_content(acc_1.name)

      click_on "Delete"

      expect(current_path).to eq(admin_bike_shop_path)
      expect(Accessory.count).to eq(0)
      expect(page).to_not have_content(acc_1.description)
    end

#     As an admin user,
# When I visit the admin dashboard,
# I see a list of all orders,
# I see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed"),
# I see a link for each individual order,
# I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed"),
# I have links to transition between statuses
#
# I can click on "cancel" on individual orders which are "paid" or "ordered"
# I can click on "mark as paid" on orders that are "ordered"
# I can click on "mark as completed" on orders that are "paid"

    it 'displays a list of all orders with attributes and links' do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "admin", password: "j98jdoas", role: 1)
      user = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "user", password: "j98jdoas", role: 0)
      order = user.orders.create
      order_2 = user.orders.create
      accessory = Accessory.create(name: "oiad", price: 123, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")
      order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id, order_id: order.id)
      order_accessory = order.order_accessories.create(quantity: 5, accessory_id: accessory.id, order_id: order_2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      expect(page).to have_content(order.id)
      expect(page).to have_content(order.created_at)
      expect(page).to have_content(order.user.full_name)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order_2.id)
      expect(page).to have_content(order_2.created_at)
      expect(page).to have_content(order_2.user.full_name)
      expect(page).to have_content(order_2.status)
    end
  end
end
