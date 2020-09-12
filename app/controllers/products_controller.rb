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
    if @product
      @product.destroy
      render json: {
          status: :deleted
      }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image, :description, :rating)
  end
end
