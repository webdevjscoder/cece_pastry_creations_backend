class CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: CustomerSerializer.new(customers)
  end

  def show
    customer = Customer.find_by_id(params[:id])
    render json: CustomerSerializer.new(customer)
  end
end
