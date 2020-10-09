class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items
  
  has_one :order


  def caculate_total_amount
    cart_items.collect do |ci|
      ci.valid? ? ci.quantity * ci.save_price_to_cart_item : 0
    end
  end
  def coupons
    a = self.caculate_total_amount.sum.to_f
    if a >= 100
      a * 10/100
    elsif a >= 80
      a * 5/100
    elsif a >= 35
      a * 2/100
    else
      a * 0
    end
  end
  def total_price_after_coupons
    b = self.caculate_total_amount.sum.to_f - self.coupons
  end
end