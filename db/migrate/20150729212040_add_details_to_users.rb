class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birthday, :datetime
    add_column :users, :skill_description, :text
    add_column :users, :education_level, :string
    add_column :users, :degree, :string
  end
end
