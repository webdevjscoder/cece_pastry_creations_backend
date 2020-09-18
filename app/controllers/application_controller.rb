class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user

  def login!
    session[:customer_id] = @customer.id
  end

  def logged_in?
    !!session[:customer_id]
  end

  def current_user
    @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def authorized_user?
    @customer == current_user
  end

  def logout!
    session.clear
  end

  def set_user
    @customer = Customer.find_by(id: session[:customer_id])
  end

end
