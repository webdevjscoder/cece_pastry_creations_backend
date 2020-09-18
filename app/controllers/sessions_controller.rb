class SessionsController < ApplicationController

  def create
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer && @customer.authenticate(params[:customer][:password])
      cart = @customer.carts.find do |cart|
        cart.current_cart == true
      end
      login!
      render json: {
          logged_in: true,
          customer: @customer,
          cart: cart.id
      }
    else
      render json: {
          status: 401,
          errors: ['no such user, please try again']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      cart = current_user.carts.find do |cart|
        cart.current_cart == true
      end
      render json: {
          logged_in: true,
          customer: current_user,
          cart: cart.id
      }
    else
      render json: {
          logged_in: false,
          message: 'no such user'
      }
    end
  end

  def logout
    logout!
    render json: {
        status: 200,
        logged_out: true
    }
  end

end