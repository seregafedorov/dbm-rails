class AddTagToProjectTranslations < ActiveRecord::Migration
  def change
    add_column :project_translations, :tag, :text
  end
end
