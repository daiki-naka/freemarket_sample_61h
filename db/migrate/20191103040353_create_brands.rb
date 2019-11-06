class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.text :profile, null: false
      t.timestamps
    end
  end
end
