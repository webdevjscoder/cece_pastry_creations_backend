class SessionsController < ApplicationController

  def create
    @customer = Customer.find_by(email: params[:email])
    byebug
    if @customer && @customer.authenticate(params[:password])
      byebug
      login!
      byebug
      render json: {
          logged_in: true,
          customer: @customer
      }
    else
      byebug
      render json: {
          status: 401,
          errors: ['no such user, please try again']
      }
    end
  end

  def is_logged_in?
    byebug
    if logged_in? && current_user
      byebug
      render json: {
          logged_in: true,
          customer: current_user
      }
    else
      render json: {
          logged_in: false,
          message: 'no such user'
      }
    end
  end

  def destroy
    logout!
    render json: {
        status: 200,
        logged_out: true
    }
  end

  private

  def session_params
    params.require(:customer).permit(:email, :password)
  end

end