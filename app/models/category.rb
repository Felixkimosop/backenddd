class Category < ApplicationRecord
    has_many :contents
    has_many :subscriptions
  
    validates :name, presence: true
end
