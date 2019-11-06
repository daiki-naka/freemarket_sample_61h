class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :category
end
