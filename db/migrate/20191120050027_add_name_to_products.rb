class AddNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_size,:string
  end
end
