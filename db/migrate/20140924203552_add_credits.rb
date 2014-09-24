class AddCredits < ActiveRecord::Migration
  def change
    add_column :activity_translations, :credit, :text
    add_column :project_translations, :credit, :text
    add_column :profile_translations, :credit, :text
  end
end
