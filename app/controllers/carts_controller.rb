class CartsController < ApplicationController
  before_action :set_cart,only: [:index]
   
  def index
    @cart_items = @cart.cart_items
  end
  
  private
  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
