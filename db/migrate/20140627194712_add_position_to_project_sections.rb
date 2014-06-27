class AddPositionToProjectSections < ActiveRecord::Migration
  def change
    add_column :project_sections, :position, :integer, :default => 0
  end
end
