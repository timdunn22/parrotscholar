class RemoveTimeAvailableForProfilePolicies < ActiveRecord::Migration
  def change
    remove_column :profile_policies, :time_available, :boolean
  end
end
