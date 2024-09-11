module CartsHelper
  def set_order_summery
    set_cart
    @sub_total = 0
    @tax =  0
    @discount = 0
    @shipping_charge = 0
    @cart_items = @cart.cart_items
    @cart_items.each do |item|
      @sub_total += (item.product.price *  item.quantity)
      unless item.product.discount.nil?
        @discount += (((item.product.price * item.product.discount)/100) * item.quantity)
      end
    end
    @tax = (((@sub_total - @discount) * 18) / 100)
    @sub_total >= 500 ? @shipping_charge = 0 : @shipping_charge = 50
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
