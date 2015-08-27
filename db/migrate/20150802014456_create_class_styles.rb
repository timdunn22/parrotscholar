class CreateClassStyles < ActiveRecord::Migration
  def change
    create_table :class_styles do |t|
      t.integer :user_id
      t.string :user_type
      t.boolean :im
      t.boolean :video
      t.boolean :screen
      t.boolean :file
      t.boolean :audio
    end
    add_index :class_styles, :user_id
  end
end
