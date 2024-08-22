class ProductsController < ApplicationController
  def index
      @products = Product.all
  end

  def new 
    @product = Product.new()
  end

  def create
    if current_user.seller.present?
      debugger
      @product = current_user.seller.products.new(product_params)
      if @product.save
        attach_images(@product)
        flash[:notice] = "product created successfully."
        redirect_to "/sellerProduct"
      else
        flash.now[:alert] = "product can't be added.."
        render :new
      end
    else
      flash[:notice] = "enter the seller details."
      redirect_to "/sellers/new"
    end
  end

  def sellerProduct
      @sellerProduct = current_user.seller.products.all
  end

  def show
  end

  def edit
      @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      attach_images(@product)
      flash[:notice] = "product updated"
      redirect_to '/sellerProduct'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
        flash[:notice] = "product has been deleted."
        redirect_to '/sellerProduct'
    else
        flash.now[:alert] = "product id can't be found."
        render '/sellerProduct'
    end
  end

  def add_to_cart
      @cart = current_user.cart || current_user.create_cart
      @order_items = @cart.order_items.
  end

  private
  
  def product_params
    params.require(:product).permit(:name,:description,:price,:stock,:product_type,images:[])
  end
  def attach_images(product)
      if params[:product][:images].present?
          product.images.attach(params[:product][:images])
      end
  end

end
