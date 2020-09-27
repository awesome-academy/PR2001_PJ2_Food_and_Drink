class OrderMailer < ApplicationMailer
  default from: "truongvietbach10a1k64@gmail.com"
  def new_order_email
    @order = params[:order]
    mail to: @order.user.email, subject: "You got a new order!"
  end
end
