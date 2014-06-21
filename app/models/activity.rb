class Activity < ActiveRecord::Base

  mount_uploader :attachment, BaseUploader

end
