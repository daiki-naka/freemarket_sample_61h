class RemoveMetaFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :meta, :string
  end
end
