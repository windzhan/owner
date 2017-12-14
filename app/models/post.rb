class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
end
