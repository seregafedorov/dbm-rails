class AdditionalFieldsForProjects < ActiveRecord::Migration
  def change
    add_column :project_translations, :feat_heading, :text
    add_column :project_translations, :feat_lead, :text
    add_column :project_translations, :tag, :text

    add_column :projects, :card_image, :text


    add_column :project_section_translations, :subheading, :text
    add_column :project_section_translations, :section_text, :text

  end
end
