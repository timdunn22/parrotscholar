class RemoveUnusefulFieldsFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :string, :string
    remove_column :students, :class_people, :string
  end
end
