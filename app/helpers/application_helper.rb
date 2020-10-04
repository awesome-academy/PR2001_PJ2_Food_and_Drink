module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Admin | Food & Drink"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def current_cart
    cart = Cart.initial.where(user_id: current_user.id).last
    if cart
      cart    
    else
      Cart.initial.new user_id: current_user.id
    end
  end
end
