class CreateUsersTimeSlots < ActiveRecord::Migration
  def change
    create_table :users_time_slots do |t|
      t.string :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :user_type
      t.boolean :available
    end
    add_index :users_time_slots, :user_id
  end
end
