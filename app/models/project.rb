class Project < ActiveRecord::Base
  translates :name, :card_info, :feat_heading, :feat_lead, :tag

  has_many :project_sections


  active_admin_translates :name, :card_info, :feat_heading, :feat_lead, :tag
  accepts_nested_attributes_for :project_sections

  mount_uploader :card_image, BaseUploader

end
