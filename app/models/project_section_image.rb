class ProjectSectionImage < ActiveRecord::Base

  translates :caption



  active_admin_translates :caption


  belongs_to :project_section

  mount_uploader :image, Md5NameUploader

end