class AddFieldsToEntrepreneurs < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :desired_role, :string
    add_column :entrepreneurs, :institute_description, :text
    add_column :entrepreneurs, :experience_description, :text
    add_column :entrepreneurs, :institute_policies_interests, :text
  end
end
