class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :name
      t.string :preferred_size
      t.text :expectations_description
      t.string :price_range

      t.timestamps null: false
    end
  end
end
