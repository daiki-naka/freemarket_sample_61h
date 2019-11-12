class AddThingsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string 
    add_column :users, :v_good, :integer
    add_column :users, :v_accept, :integer 
    add_column :users, :v_bad, :integer
  end
end
