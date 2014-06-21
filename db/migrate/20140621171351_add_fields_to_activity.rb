class AddFieldsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :name, :text
    add_column :activities, :heading, :text
    add_column :activities, :description, :text
    add_column :activities, :link, :text
  end
end
