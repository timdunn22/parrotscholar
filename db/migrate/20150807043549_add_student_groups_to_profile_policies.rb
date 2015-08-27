class AddStudentGroupsToProfilePolicies < ActiveRecord::Migration
  def change
    add_column :profile_policies, :student_groups, :boolean
  end
end
