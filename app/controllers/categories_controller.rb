class CategoriesController < ApplicationController
  layout "layouts/category/application"
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find params[:id]
    @products = @category.products
  end
end
