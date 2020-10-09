class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
       user.email = provider_data.info.email
       user.password = Devise.friendly_token[0, 20]
    end
  end
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  acts_as_paranoid
  acts_as_voter
end
