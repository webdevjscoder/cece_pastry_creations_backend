class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price, :description, :image, :rating
  has_many :line_items
end
