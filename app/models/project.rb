class Project < ActiveRecord::Base
  translates :name, :card_info, :feat_heading, :feat_lead

  has_many :project_sections


  active_admin_translates :name, :card_info, :feat_heading, :feat_lead
  accepts_nested_attributes_for :project_sections

  mount_uploader :card_image, BaseUploader

end
