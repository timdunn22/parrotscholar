class AddUserToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :user_id, :integer
    add_index :entrepreneurs, :user_id
  end
end
