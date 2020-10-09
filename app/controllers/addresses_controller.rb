class AddressesController < ApplicationController
  layout "layouts/order/application"
  def index
    @addresses = current_user.addresses
    @address_first = current_user.addresses.first
  end
  def new
    @address = current_user.addresses.build
  end
  def create
    @address = current_user.addresses.build address_params
    respond_to  do |format|  
      if @address.save
        format.html { redirect_to user_addresses_path(current_user.id)}
        format.js
      else
        format.html { render 'products/show' }
        format.js
      end
    end 
  end
  def destroy
    @address = current_user.addresses.find params[:id]
    @address.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to admin_addresses_path }
      format.json { head :no_content }
    end
  end
  private 
  def address_params
    params.require(:address).permit :user_name, :numberphone, :stress, :wards, :district, :province
  end
end
  