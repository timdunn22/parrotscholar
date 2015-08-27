class AddDetailsToProfilePolicies < ActiveRecord::Migration
  def change
    add_column :profile_policies, :class_enrolled, :boolean
    add_column :profile_policies, :schedule, :boolean
  end
end
