class LineItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :total
  belongs_to :product
end
