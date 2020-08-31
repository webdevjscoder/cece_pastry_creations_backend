class ProductsController < ApplicationController

  def index
    products = Product.all
    options = {
        include: [:line_items]
    }
    render json: ProductSerializer.new(products)
  end

  def show
    product = Product.find_by_id([:id])
    options = {
        include: [:line_items]
    }
    render json: ProductSerializer.new(product)
  end
end
