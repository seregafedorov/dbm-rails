class ProjectRelation < ActiveRecord::Base

  belongs_to :parent, class_name: 'Project'
  belongs_to :child, class_name: 'Project'


end