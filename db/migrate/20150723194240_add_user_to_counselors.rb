class AddUserToCounselors < ActiveRecord::Migration
  def change
    add_column :counselors, :user_id, :integer
    add_index :counselors, :user_id
  end
end
