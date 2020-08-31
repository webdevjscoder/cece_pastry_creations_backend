class CartsController < ApplicationController

  def index
    carts = Cart.all
    options = {
        include: [:customer]
    }
    render json: CartSerializer.new(carts, options)
  end

  def show
    cart = Cart.find_by_id(params[:id])
    options = {
        include: [:customer]
    }
    render json: CartSerializer.new(cart, options)
  end
end
