class CustomersController < ApplicationController

  def index
    customers = Customer.all
    options = {
        include:
    }
  end

  def show

  end
end
