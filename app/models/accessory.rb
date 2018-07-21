class Accessory < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :price, :status, :description

  has_many :order_accessories
  has_many :orders, through: :order_accessories
end
