class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string, null: false
    add_column :products, :introduction, :text, null: false
    add_column :products, :status,:string, null: false
    add_column :products, :d_charge, :string,	null: false
    add_column :products, :d_method, :string,	null: false
    add_column :products, :d_origin, :string,	null: false
    add_column :products, :d_interval,:string,	null: false
    add_column :products, :price,	:integer,	null: false
    add_column :products, :category_id,:integer,	null: false, foreign_key: true
    add_column :products, :user_id, :integer,	null: false, foreign_key: true
    add_column :products, :brand_id,:integer,	null: false, foreign_key: true
    add_column :products, :product_size,:string	
  end
end