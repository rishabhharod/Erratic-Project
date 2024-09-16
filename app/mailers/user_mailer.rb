class UserMailer < ApplicationMailer

  def login_notification(user)
    @user = user 
    mail(to: @user.email, subject: 'welcome to our Ecommerce website.')
  end

  def product_added(product,current_user)
    @product = product
    @current_user = current_user
    mail(to: @current_user.email, subject: 'Dear seller your Product has been added.')
  end

  def seller_created(seller)
    @seller = seller
    mail(to: @seller.user.email, subject: "#{@seller.user.name} Now you are become a seller.")
  end
end
