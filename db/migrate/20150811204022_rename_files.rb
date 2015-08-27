class RenameFiles < ActiveRecord::Migration
  def self.up
   rename_table :files, :attachments
  end

  def self.down
    rename_table :attachments, :files
  end
end
