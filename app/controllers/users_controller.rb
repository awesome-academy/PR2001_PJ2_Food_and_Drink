class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_user
  def show
  end
  def about
  end
  private 
  def get_user
    @user = current_user
    redirect_to root_path unless @user
  end

end
  def show
    @orders = current_user.orders
    @products = current_cart.products
  end 
end
  
