class AddFieldsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :hire_description, :text
    add_column :teachers, :course_type, :string
    add_column :teachers, :price_negotiation, :string
  end
end
