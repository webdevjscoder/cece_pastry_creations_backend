class Cart < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  accepts_nested_attributes_for :line_items, allow_destroy: true

  def self.line_items(cart_object)
    cart_object.line_items.collect do |item|
      item.product
    end
  end

end
