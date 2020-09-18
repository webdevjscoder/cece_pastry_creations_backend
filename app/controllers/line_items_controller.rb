class LineItemsController < ApplicationController

  def index
    line_items = LineItem.all
    render json: line_items, include: [:cart, :product]
  end

  def create
    @line_item = LineItem.new(line_items_params)
    @customer =  Customer.find_by_id(params[:customer_id][:currentUserId])
    @customer.carts.find { |cart| cart.current_cart == true ? @line_item.cart_id = cart.id : nil }
    if @line_item.quantity == nil
      @line_item.increment!(:quantity, by = 1)
    end
    if @line_item.save
      render json: {
          status: :created,
          line_item: @line_item, include: [:product, :cart]
      }
    end
  end

  def show
    @line_item = LineItem.find_by_id(params[:id])
    if @line_item
      render json: @line_item, include: [:product, :cart]
    end
  end

  def update
    @line_item = LineItem.find_by_id(params[:id])
    if @line_item
      @line_item.update(line_items_params)
      @line_item.save
      render json: @line_item, include: [:product, :cart]
    end
  end

  def destroy
    @line_item = Cart.find_by_id(params[:id]).line_items.find_by(cart_id: params[:id])
    if @line_item
      LineItem.delete(@line_item)
      render json: {
          status: :deleted
      }
    end
  end

  private

  def line_items_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity, :total)
  end
end
