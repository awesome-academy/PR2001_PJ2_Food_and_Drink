class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :orders
  ratyrate_rater
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
end
