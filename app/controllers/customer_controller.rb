class CustomerController < ApplicationController
  layout "customer"
  before_action :authenticate_customer!

  def index
    
  end
end
