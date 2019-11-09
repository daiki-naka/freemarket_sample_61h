class Product < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :users,through: :likes
  has_many :likes
end
