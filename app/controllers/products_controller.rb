class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:vote]
  before_action :get_id_product, only: [:show, :vote]
  respond_to :js, :json, :html
  def index
    @products = Product.all.page(params[:page]).per(2)
  end

  def show
    @comment = @product.comments.build
    @comments = @product.comments.reject{|i| i.id.blank?}
    @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(5) 
    @toppings = Topping.all
    @cart_item = @product.cart_items.build
  end

  def vote
     if !current_user.liked? @product
       @product.liked_by current_user  
     elsif current_user.liked? @product
       @product.unliked_by current_user
     end
  end
  private
  def get_id_product
    @product = Product.find params[:id]
  end
end
