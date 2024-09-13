class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
      @products = Product.all
  end

  def new 
    @product = Product.new()
  end

  def create
    if current_user.seller.present?
      @product = current_user.seller.products.new(product_params)
      if @product.save
        UserMailer.product_added(@product,current_user).deliver_now
        attach_images(@product)
        flash[:notice] = 'Product created successfully.'
        redirect_to sellerProduct_path
      else
        flash.now[:alert] = 'Product can not be add'
        render :new
      end
    else
      flash[:notice] = 'Enter the seller details.'
      redirect_to new_seller_path
    end
  end

  def sellerProduct
    @sellerProducts = current_user.seller.products.all
  end

  def show
    @product
  end

  def edit
    @product
  end

  def update
    if @product.update(product_params)
      attach_images(@product)
      flash[:notice] = 'Product updated.'
      redirect_to sellerProduct_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = 'Product has been deleted.'
      redirect_to sellerProduct_path
    else
      flash.now[:alert] = 'Product id can not be found.'
      render sellerProduct_path
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:name,:description,:price,:stock,:product_type,:discount,images:[])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def attach_images(product)
    if params[:product][:images].present?
      product.images.attach(params[:product][:images])
    end
  end
end
