class AddKeyword1ToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :keyword1, :string, {null: false}
    add_column :brands, :keyword2, :string, {null: false}
  end
end
