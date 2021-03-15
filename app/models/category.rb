# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true

  acts_as_paranoid
  searchkick
end
