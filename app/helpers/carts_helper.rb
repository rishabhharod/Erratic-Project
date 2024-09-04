module CartsHelper

  def set_order_summery
    set_cart
    @sub_total = 0
    @tax =  0
    @shipping_charge = 0
    @cart_items = @cart.cart_items
    @cart_items.each do |item|
      @sub_total += (item.product.price *  item.quantity)
    end
    @tax = ((@sub_total * 18) / 100)
    @sub_total >= 500 ? @shipping_charge = 0 : @shipping_charge = 50
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

end
