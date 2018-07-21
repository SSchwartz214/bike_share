class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :role

  enum role: ['default', 'admin']

  has_secure_password

  has_many :orders
end
