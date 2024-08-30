class WishlistItemsController < ApplicationController
  before_action :set_wishlist
  
  def create
    product = Product.find(params[:product_id])
    wishlist_items = @wishlist.wishlist_items.find_or_initialize_by(product_id: product.id)
    if wishlist_items.new_record?
      wishlist_items.save
      flash[:notice] = 'Product wishlisted'
      redirect_to wishlist_path
    else
      flash[:alert] = 'Already wishlisted'
      redirect_to product_path(product)
    end
  end

  def destroy
    wishlist_item = @wishlist.wishlist_items.find(params[:id])
    if wishlist_item.destroy
      flash[:notice] = 'Product removed'
      redirect_to wishlist_path
    else
      flash[:alert] = 'Product id not found'
      render wishlist: show
    end
  end

  private
  def set_wishlist
    @wishlist = current_user.wishlist || current_user.create_wishlist
  end
end
