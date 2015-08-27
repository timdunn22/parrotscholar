class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.integer :user_id
      t.string :file_name
      t.text :file_description
      t.string :file_type
    end
    add_index :files, :user_id
  end
end
