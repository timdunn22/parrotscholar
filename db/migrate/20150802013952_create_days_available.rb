class CreateDaysAvailable < ActiveRecord::Migration
  def change
    create_table :days_availables do |t|
      t.integer :user_id
      t.string :user_type
      t.boolean :monday_available
      t.boolean :tuesday_available
      t.boolean :wednesday_available
      t.boolean :thursday_available
      t.boolean :friday_available
      t.boolean :saturday_available
      t.boolean :sunday_available
    end
    add_index :days_availables, :user_id
  end
end
