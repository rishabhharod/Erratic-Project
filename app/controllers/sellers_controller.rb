class SellersController < ApplicationController
    def new
        @seller = Seller.new
    end
    def create
        if current_user.role.eql?("seller") 
            if current_user.seller.present?
                flash[:notice] = "seller details are exist.."
                redirect_to root_path
            else
                @seller = Seller.new(seller_params)
                if @seller.save
                    flash[:notice] = "seller details submitted successfully."
                    redirect_to root_path
                else
                    flash.now[:alert] = "seller id can't be genrated."
                    render :new
                end
            end
        else
            flash[:notice] = "You are not a seller"
            redirect_to root_path
        end
    end
    private 
    def seller_params
        params.require(:seller).permit(:company_email,:GSTIN_number,:contact,:category,:user_id)
    end
end
