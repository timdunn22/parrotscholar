class CreateUsersInterests < ActiveRecord::Migration
  def change
    create_table :users_interests do |t|
      t.string :subject
      t.string :user_type
      t.integer :user_id
      t.string :competency
    end
    add_index :users_interests, :user_id
  end
end
