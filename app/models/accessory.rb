class Accessory < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :price, :status, :description

  enum status: ['active', 'retired']

  has_many :order_accessories, dependent: :destroy
  has_many :orders, through: :order_accessories
end
