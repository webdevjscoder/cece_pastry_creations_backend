class CartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
  belongs_to :customer
end
