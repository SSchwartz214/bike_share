class Order < ApplicationRecord
  validates_presence_of :status

  belongs_to :user
  has_many :order_accessories
  has_many :accessories, through: :order_accessories

  def total
    order_accessories.inject(0) {|sum, order_accessory| sum + order_accessory.subtotal}
  end

  def self.group_by_status
    group(:status).count
  end
end
