class OrderAccessory < ApplicationRecord
  belongs_to :order
  belongs_to :accessory

  def subtotal
    price = Accessory.find(accessory_id).price
    quantity * price
  end
end
