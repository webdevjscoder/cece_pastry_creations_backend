class CartsController < ApplicationController

  def index
    @carts = Cart.all
    render json: @carts, include: [:customer]
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
      render json: {cart: @cart, products: @cart.line_items.map{|li| {name: li.product.name, quantity: li.quantity}}}
    end
  end

  def list_line_items
    @cart = Cart.find_by_id(params[:id])
    @cart_line_items = Cart.line_items(@cart)
    @line_items = @cart.line_items
    render json: @cart_line_items
  end

  def update
    @cart = Cart.find_by_id(params[:id])
    if @cart
      @cart.update(cart_params)
      @cart.save
      render json: @cart
    end
  end

  def clear_cart
    @cart = Cart.find_by_id(params[:id])
    @line_items = @cart.line_items
      if @line_items
        LineItem.delete(@line_items)
        render json: {
            status: :deleted
        }
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
    params.require(:cart).permit([:customer_id, line_items_attributes: [:id, :quantity, :total]])
  end
end
