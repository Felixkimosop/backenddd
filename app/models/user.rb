class User < ApplicationRecord
    has_secure_password
    has_many :contents
    has_many :comments
    has_many :subscriptions
    has_many :categories, through: :subscriptions
  
    # before_create :generate_token
  
    # def generate_token
    #   self.token = loop do
    #     token = SecureRandom.urlsafe_base64(32)
    #     break token unless User.exists?(token: token)
    #   end
    # end
  end
