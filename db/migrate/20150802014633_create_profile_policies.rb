class CreateProfilePolicies < ActiveRecord::Migration
  def change
    create_table :profile_policies do |t|
      t.integer :user_id
      t.string :user_type
      t.string :time_available
      t.string :class_preferences
      t.string :profile_details
      t.string :files_uploaded
    end
    add_index :profile_policies, :user_id
  end
end
