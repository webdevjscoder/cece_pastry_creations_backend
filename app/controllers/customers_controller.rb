class CustomersController < ApplicationController
  wrap_parameters Customer

  def index
    @customers = Customer.all
    if @customers
      render json: {
          customers: @customers
      }
    end
  end

  def show
    @customer = Customer.find_by_id(params[:id])
    if @customer
      render json: {
          customers: @customer
      }
    end
  end

  def create
    @customer = Customer.new(customer_params(:first_name, :last_name, :email, :password, :phone_number, :is_admin))
    if @customer.save
      login!
      render json: {
          status: :created,
          customer: @customer
      }
    else
      render json:  {
          status: 500,
          errors: @customer.errors.full_messages
      }
    end
  end

  def update
    @customer = Customer.find_by_id(params[:id])
    if @customer
      @customer.update(customer_params(:first_name, :last_name, :email, :password, :phone_number, :is_admin))
      @customer.save
      render json: {
          status: :updated,
          customer: @customer
      }
    end
  end

  def destroy
    @customer = Customer.find_by_id(params[:id])
    if @customer
      @customer.destroy
      render json: {
          status: :deleted
      }
    end
  end

  private

  def customer_params(*args)
    params.require(:customer).permit(*args)
  end

end
