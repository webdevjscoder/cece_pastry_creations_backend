class Customer < ApplicationRecord
  has_secure_password
  has_many :carts
  validates :email, presence: true
  validates :email, uniqueness: true
end
