# == Schema Information
#
# Table name: cart_items
#
#  id                      :bigint           not null, primary key
#  quantity                :integer
#  total_product           :integer
#  save_price_to_cart_item :integer
#  category_id             :integer
#  product_id              :bigint
#  cart_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :set_save_price_to_cart_item

  def save_price_to_cart_item
    # If there is a record
    if persisted?
      self[:save_price_to_cart_item]
    else
      product.price
    end
  end
  def get_total_price 
    save_price_to_cart_item * quantity
  end
  private
  def set_save_price_to_cart_item
    self[:save_price_to_cart_item] = save_price_to_cart_item
  end
end
