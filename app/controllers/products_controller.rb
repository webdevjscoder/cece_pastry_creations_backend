class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {
          status: :created,
          product: @product
      }
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
    if @product
      render json: @product
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product
      @product.update(product_params)
      @product.save
      render json: @product
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @cart_id = @product.line_items.find_by(product_id: @product.id).cart_id
    @line_item = Product.remove_line_item(@product, @cart_id)
    if @line_item
      @line_item.destroy
      render json: {
          status: :deleted
      } and return
    elsif @product
      @product.destroy
      render json: {
          status: :deleted
      } and return
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image, :description, :rating)
  end

end
