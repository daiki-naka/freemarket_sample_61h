class AddNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string, {null: false}
    add_column :products, :introduction, :text, {null: false}
    add_column :products, :status, :string, {null: false}
    add_column :products, :d_charge, :string, {null: false}
    add_column :products, :d_method, :string, {null: false}
    add_column :products, :d_origin, :string, {null: false}
    add_column :products, :d_interval, :string, {null: false}
    add_column :products, :price, :string, {null: false}
    add_column :products, :product_size, :string
    add_reference :products, :user, foreign_key: true
    add_reference :products, :category, foreign_key: true
    add_reference :products, :brand, foreign_key: true
  end
end
