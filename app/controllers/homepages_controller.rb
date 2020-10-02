class HomepagesController < ApplicationController
    def home
     end 
  def home
    @categories = Category.all
    @products = Product.all
    @carts = current_cart
    if signed_in?
      @addresses = current_user.addresses
    end
  end
end