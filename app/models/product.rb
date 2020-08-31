class Product < ApplicationRecord
  has_many :line_items
  validates :name, presence: true
  validates :name, uniqueness: true
end
