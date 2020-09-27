class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(2)
  end

  def show
    @product = Product.find params[:id]
    @comment = @product.comments.build
    @comments = @product.comments.reject{|i| i.id.blank?}
    @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(2) 
    @toppings = Topping.all
    @cart_item = @product.cart_items.build
  end
end
