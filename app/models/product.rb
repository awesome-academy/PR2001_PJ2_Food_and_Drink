# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                      :bigint           not null, primary key
#  name_product            :string(255)
#  information             :text(65535)
#  old_price               :integer
#  price                   :integer
#  kind                    :integer
#  category_id             :bigint           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  deleted_at              :datetime
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float(24)        default(0.0)
#
class Product < ApplicationRecord
  acts_as_votable
  searchkick

  belongs_to :category
  has_many :comments
  has_many :cart_items
  has_many_attached :images

  enum kind: [:food, :drink]

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
