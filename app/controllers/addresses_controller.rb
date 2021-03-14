class AddressesController < ApplicationController
  # layout "layouts/order/application"
  def index
    @addresses = current_user.addresses
  end
  def new
    @address = current_user.addresses.build
  end
  def create
    @address = current_user.addresses.build address_params
    respond_to  do |format|
      if @address.save
        format.html { redirect_to user_addresses_path(current_user.id)}
        format.js { @address_counter = current_user.addresses.count }
      else
        format.html { render 'products/show' }
        format.js
      end
    end
  end
  def edit
  end
  def update

  end
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end
  private
  def address_params
    params.require(:address).permit :user_name, :numberphone, :stress, :wards, :district, :province
  end
end
