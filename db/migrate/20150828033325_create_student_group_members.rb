class CreateStudentGroupMembers < ActiveRecord::Migration
  def change
    create_table :student_group_members do |t|
      t.integer :user_id
      t.integer :student_group_id
      t.string :role
      t.text :role_description

      t.timestamps null: false
    end
    add_index :student_group_members, :user_id
    add_index :student_group_members, :student_group_id
  end
end
