class AddUserToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :user_id, :integer
    add_index :teachers, :user_id
  end
end
