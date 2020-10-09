class UsersController < ApplicationController
  def show
    @orders = current_user.orders
    @orders_cancel = @orders.with_deleted

  end 
end
  