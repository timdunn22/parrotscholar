class ChangeFormatInProfilePolicies < ActiveRecord::Migration

  def self.up
    # change_column :profile_policies, :time_available, :boolean
    # change_column :profile_policies, :class_preferences, :boolean
    # change_column :profile_policies, :profile_details, :boolean
    # change_column :profile_policies, :files_uploaded, :boolean
  end

  def self.down
    # change_column :profile_policies, :time_available, :string
    # change_column :profile_policies, :class_preferences, :string
    # change_column :profile_policies, :profile_details, :string
    # change_column :profile_policies, :files_uploaded, :string
  end
end
