class AddressesController < ApplicationController
  include CartsHelper

  def index
    @address = current_user.addresses.first
    @order_summery = set_order_summery
  end
end
