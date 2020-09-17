# frozen_string_literal: true

class Product < ApplicationRecord
  acts_as_votable

  belongs_to :category


  has_many :comments
  has_many :cart_items
  has_many_attached :images



  enum kind: {food: 0, drink: 1}
  
  validates :name_product, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: true
  validates :information, presence: true, length: { maximum: 255 }

  delegate :name, :image, to: :category, allow_nil: true, prefix: true

  acts_as_paranoid

  def self.limit_product
    order(created_at: :desc).limit(8)
  end

  # self.inheritance_column = :kind_of

  # def self.kind_ofs
  #   %w[Drink Food]
  # end
end