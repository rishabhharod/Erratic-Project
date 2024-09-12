class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show] 
  
  def show
    @wishlist_items = @wishlist.wishlist_items
  end
  
  private 
  
  def set_wishlist
    @wishlist = current_user.wishlist || current_user.create_wishlist
  end
end
