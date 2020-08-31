class CustomersController < ApplicationController

  def index
    customers = Customer.all
    options = {
        include: [:carts]
    }
    render json: CustomerSerializer.new(customers, options)
  end

  def show
    customer = Customer.find_by_id(params[:id])
    options = {
        include: [:carts]
    }
    render json: CustomerSerializer.new(customer, options)
  end
end
