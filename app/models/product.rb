class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.remove_line_item(product_obj, cart_id)
    product_obj.line_items.each do |line_item|
      if line_item.cart_id == cart_id
        return line_item
      end
    end
  end
end
