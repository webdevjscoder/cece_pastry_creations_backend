class CartsController < ApplicationController

  def index
    carts = Cart.all
    options = {
        include: [:customer]
    }
    render json: CartSerializer.new(carts, options)
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      render json: {
          status: :created,
          cart: @cart
      }
    end
  end

  def show
    @cart = Cart.find_by_id(params[:id])
    if @cart
      render json:
          @cart,
          include: [:customer]
    end
  end

  def update
    @cart = Cart.find_by_id(params[:id])
    if @cart
      @cart.update(cart_params)
      @cart.save
      render json: @cart
    end
  end

  def destroy
    @cart = Cart.find_by_id(params[:id])
    if @cart
      @cart.destroy
      render json: {
          status: :deleted
      }
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:customer_id)
  end
end
