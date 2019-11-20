class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :name_f, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :last_name_f, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :phone_number, :string, null: false, unique: true
    add_column :users, :d_name, :string, null: false
    add_column :users, :d_name_f, :string, null: false
    add_column :users, :d_last_name, :string, null: false
    add_column :users, :d_last_name_f, :string, null: false
    add_column :users, :postal_code, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :building_name, :string
    add_column :users, :d_phone_number, :string
    add_column :users, :v_good, :integer
    add_column :users, :v_accept, :integer
    add_column :users, :v_bad, :integer
    add_column :users, :avatar, :string
    add_column :users, :profile, :text
  end
end
