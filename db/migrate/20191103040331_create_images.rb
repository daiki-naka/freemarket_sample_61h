class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :picture, null: false
      t.timestamps
      t.references :product, foreign_key: true
    end
  end
end
