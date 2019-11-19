class Category < ApplicationRecord
  has_many :products
  has_ancestry
  paginates_per 5

end
