class Order < ApplicationRecord
    belongs_to :cart, optional: true
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