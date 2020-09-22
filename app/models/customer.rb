class Customer < ApplicationRecord
  has_secure_password
  has_many :carts, dependent: :destroy
  accepts_nested_attributes_for :carts, allow_destroy: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
end
