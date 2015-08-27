class Attachment < ActiveRecord::Base
  mount_uploader :file_name, FileNameUploader
  belongs_to :user
end
