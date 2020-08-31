class ProductsController < ApplicationController

  def index
    products = Product.all
    render json: ProductSerializer.new(products)
  end

  def show
    product = Product.find_by_id([:id])
    render json: ProductSerializer.new(product)
  end
end
