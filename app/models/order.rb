# == Schema Information
#
# Table name: orders
#
#  id                  :bigint           not null, primary key
#  payments            :integer
#  save_price_to_order :integer
#  user_id             :bigint           not null
#  cart_id             :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  order_code          :string(255)
#  status              :integer
#  deleted_at          :datetime
#  address_id          :integer
#
class Order < ApplicationRecord
    belongs_to :cart, optional: true, dependent: :destroy
    belongs_to :address,  optional: true
    belongs_to :user
    
    
    enum status: [ :confirm, :cancel, :delivered ]
    enum payment: {ship_code: 0, online: 1}

    acts_as_paranoid
    
    class << self
      def generate_order_code
        code = [*('A'..'Z')].sample(10).join
        
        while Order.find_by(order_code: code)
          code = [*('A'..'Z')].sample(10).join
        end
        code
      end
    end
end
