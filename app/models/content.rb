class Content < ApplicationRecord

  belongs_to :category
  belongs_to :user

  has_many :comments

  validates :title, presence: true
  validates :content_type, inclusion: { in: ['video', 'audio', 'article/blog'] }
end
