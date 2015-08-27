class AddLotsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :self_description, :text
    add_column :students, :available_start_date, :datetime
    add_column :students, :class_people, :string
    add_column :students, :course_type, :string
    add_column :students, :profile_visible, :string
    add_column :students, :string, :string
    add_column :students, :counselor_interest, :boolean
  end
end
