class Like < ApplicationRecord
 belongs_to :user
 belongs_to :product
 counter_culture :product
 validates :user_id, presence: true
 validates :product_id, presence: true
end
