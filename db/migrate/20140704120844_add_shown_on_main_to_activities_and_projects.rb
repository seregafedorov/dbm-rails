class AddShownOnMainToActivitiesAndProjects < ActiveRecord::Migration
  def change
    add_column :activities, :shown_on_main, :boolean, default: false
    add_column :projects, :shown_on_main, :boolean, default: false
  end
end
