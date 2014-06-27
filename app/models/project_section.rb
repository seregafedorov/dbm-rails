class ProjectSection < ActiveRecord::Base
  translates :name, :subheading, :section_text


  belongs_to :project
  has_many :project_section_images

  active_admin_translates :name, :subheading, :section_text

  accepts_nested_attributes_for :project_section_images


  default_scope -> { order('position') }

  scope :by_create_and_id, -> { order('created_at, id') }

end