class CartsController < ApplicationController
  include CartsHelper
  
  before_action :set_order_summery, only: [:index]
   
  def index
    @order_summery = set_order_summery
  end
  
end
