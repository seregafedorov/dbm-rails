class Project < ActiveRecord::Base
  translates :name, :card_info

  has_many :project_sections


  active_admin_translates :name, :card_info
  accepts_nested_attributes_for :project_sections

end
