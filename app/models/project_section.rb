class ProjectSection < ActiveRecord::Base
  translates :name

  belongs_to :project
  has_many :project_section_images

  active_admin_translates :name

  accepts_nested_attributes_for :project_section_images



end