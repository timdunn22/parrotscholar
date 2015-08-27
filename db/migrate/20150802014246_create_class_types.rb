class CreateClassTypes < ActiveRecord::Migration
  def change
    create_table :class_types do |t|
      t.integer :user_id
      t.string :user_type
      t.boolean :one_one
      t.boolean :one_many
      t.boolean :many_one
      t.boolean :institute
    end
    add_index :class_types, :user_id
  end
end
