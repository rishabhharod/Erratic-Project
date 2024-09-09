class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: product.id)
    if @cart_item.new_record?
      @cart_item.quantity = 1
    else
      @cart_item.quantity += 1
    end
    if @cart_item.save
      flash[:notice] = 'Product added to the cart.'
      redirect_to "/carts"
    else
      flash[:alert] = 'Could not add product to cart.'
      render :carts_path
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = 'Product removed.'
      redirect_to carts_path
    else
      flash[:alert] = 'product can not be remove.'
      render :carts_path
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
