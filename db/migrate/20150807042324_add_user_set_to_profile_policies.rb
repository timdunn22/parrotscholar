class AddUserSetToProfilePolicies < ActiveRecord::Migration
  def change
    add_column :profile_policies, :user_set, :string
  end
end
