# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  user_id    :bigint           not null
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :content, presence: true
  
  default_scope -> { order(created_at: :desc) }
end
