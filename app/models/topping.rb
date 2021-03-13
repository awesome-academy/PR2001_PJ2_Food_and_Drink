# == Schema Information
#
# Table name: toppings
#
#  id    :bigint           not null, primary key
#  name  :string(255)
#  kind  :integer
#  price :integer
#
class Topping < ApplicationRecord
  enum kind: {food: 0, drink: 1}

  validates :name, presence: true
  validates :price, presence: true
end
