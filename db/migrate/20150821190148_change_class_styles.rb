class ChangeClassStyles < ActiveRecord::Migration
  def self.up
    rename_column :class_styles, :im, :instant_messaging
    rename_column :class_styles, :video, :video_conferencing
    rename_column :class_styles, :screen, :screen_sharing
    rename_column :class_styles, :file, :file_sharing
  end

  def self.down
    rename_column :class_styles, :instant_messaging, :im
    rename_column :class_styles, :video_conferencing,:video
    rename_column :class_styles, :screen_sharing, :screen
    rename_column :class_styles, :file_sharing, :file
  end
end
