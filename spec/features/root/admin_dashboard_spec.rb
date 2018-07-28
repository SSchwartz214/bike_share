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
    it "shows status grouped by type" do
      user = User.create!(first_name: "wfdsx", last_name: "c", username: "redfscx", password: "oiajsiod")
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "admin", password: "j98jdoas", role: 1)

      order_1 = user.orders.create!(status: "ordered")
      order_2 = user.orders.create!(status: "paid")
      order_3 = user.orders.create!(status: "cancelled")
      order_4 = user.orders.create!(status: "completed")

      accessory = Accessory.create!(name: "oiad", price: 3, status: 0, image_url: "https://upload.wikimedia.org/wikipedia/commons/1/19/Gatling_gun_1862_Type_II_%281%29.jpg", description: "1209390jioas")

      order_accessory_1 = order_1.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_2 = order_2.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_3 = order_3.order_accessories.create!(quantity: 5, accessory_id: accessory.id)
      order_accessory_4 = order_4.order_accessories.create!(quantity: 5, accessory_id: accessory.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      expect(page).to have_content("completed: 1")
      expect(page).to have_content("paid: 1")
      expect(page).to have_content("cancelled: 1")
      expect(page).to have_content("ordered: 1")
    end
    it 'shows a link for each order' do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "admin", password: "j98jdoas", role: 1)
      user = User.create!(first_name: "wfdsx", last_name: "c", username: "redfscx", password: "oiajsiod")

      order_1 = user.orders.create!(status: "ordered")
      order_2 = user.orders.create!(status: "paid")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      within "#display_#{order_1.id}" do
        click_on "Info"
      end

      expect(current_path).to eq(order_path(order_1))
      expect(page).to have_content(order_1.status)
    end

    it "transitions between statuses" do
      admin = User.create!(first_name: "oijasdioj", last_name: "ijd098jas", username: "admin", password: "j98jdoas", role: 1)
      user = User.create!(first_name: "wfdsx", last_name: "c", username: "redfscx", password: "oiajsiod")

      order_1 = user.orders.create!(status: "ordered")
      order_2 = user.orders.create!(status: "paid")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit ad

    end
  end
end
