class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true
  validates_presence_of :role

  enum role: ['default', 'admin']

  has_secure_password

  has_many :orders

  def full_name
    first_name + " " + last_name 
  end
end
