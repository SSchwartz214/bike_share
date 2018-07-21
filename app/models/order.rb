class Order < ApplicationRecord
  validates_presence_of :status

  belongs_to :user
  has_many :order_accessories
  has_many :accessories, through: :order_accessories
end
