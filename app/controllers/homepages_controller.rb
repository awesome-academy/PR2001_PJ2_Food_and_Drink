class HomepagesController < ApplicationController
  def home
    @categories = Category.all
    @products = Product.limit(8)
    @carts = current_cart
    if signed_in?
      @addresses = current_user.addresses
    end
    @q = params[:search]
    if @q.present?
      @Products = Product.search(params[:search], load: true)
    else
      @products = Product.all.page(params[:page]).per(10)
    end
  end
end