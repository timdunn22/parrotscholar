class AddManyManyToClassTypes < ActiveRecord::Migration
  def change
    add_column :class_types, :many_many, :boolean
  end
end
