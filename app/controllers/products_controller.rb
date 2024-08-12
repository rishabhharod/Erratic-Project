class ProductsController < ApplicationController
    def new 
        @product = Product.new
    end
    def create
        if current_user.seller.present?
            @product = current_user.seller.products.new(product_params)
            if @product.save
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
    def index
        @product = Product.all
    end
    def show

    end
    private 
    def product_params
        params.require(:product).permit(:name,:description,:price,:stock,:product_type)
    end
end
