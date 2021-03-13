# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  numberphone :integer
#  stress      :string(255)
#  wards       :string(255)
#  district    :string(255)
#  province    :string(255)
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_name   :string(255)
#
class Address < ApplicationRecord
  belongs_to :user
  has_one :order
end
