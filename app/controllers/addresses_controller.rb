class AddressesController < ApplicationController
  include CartsHelper
  protect_from_forgery except: :new

  def index
    @modal_id
    @addresses = current_user.addresses
    @order_summery = set_order_summery
  end

  def new
    @address = Address.new
    @header = "Address"
  end
  
  def create
    address = current_user.addresses.new(address_params)
    if address.save!
      flash[:notice] = "New address added"
      redirect_to addresses_path
    else
      flash[:alert] = "Error ocuur during create"
      redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
    @header = "Edit Address"
  end 

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = 'Address successfully edited'
      redirect_to addresses_path
    else
      flash[:alert] = 'Error occur during edit'
      render :addresses_path
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = 'Address removed successfully.'
      redirect_to addresses_path
    else
      flash[:alert] = 'Address can not be removed.'
      render :index
    end
  end

  private

  def generate_modal_id
    @modal_id = Random.hex(3)
  end

  def address_params
    params.require(:address).permit(:full_address,:state,:city,:pincode,:landmark,:user_id,:address_type,:order_id)
  end

end
