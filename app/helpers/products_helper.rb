module ProductsHelper
  def set_discount(product)
    if product.discount.nil?
      return product.price
    else
      return (product.price * product.discount)/100
    end
  end
end
