class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :introduction, :status, :d_charge, :d_method, :d_origin, :d_interval, :category_id, :price,  presence: true
end