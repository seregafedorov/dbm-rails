class AddPositionsToProjectsAndActivities < ActiveRecord::Migration
  def change
    add_column :projects, :position, :integer, default: 0
    add_column :activities, :position, :integer, default: 0
  end
end
