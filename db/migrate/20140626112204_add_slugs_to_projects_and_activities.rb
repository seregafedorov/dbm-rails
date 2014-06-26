class AddSlugsToProjectsAndActivities < ActiveRecord::Migration
  def change
    add_column :projects, :slugged_url, :text
    add_column :projects, :slug, :text
    add_index :projects, :slug


    add_column :activities, :slugged_url, :text
    add_column :activities, :slug, :text
    add_index :activities, :slug
  end
end
