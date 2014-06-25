class CreateProjectsAndProjectSections < ActiveRecord::Migration
  def up
    Project.create_translation_table! :name => :text, :card_info => :text

    create_table :project_sections do |t|
      t.integer :project_id
      t.timestamps
    end
    ProjectSection.create_translation_table! :name => :text

    create_table :project_section_images do |t|
      t.integer :project_section_id
      t.text :image
      t.timestamps
    end
    ProjectSectionImage.create_translation_table! :caption => :text

  end

  def down
    Project.drop_translation_table!

    drop_table :project_sections
    ProjectSection.drop_translation_table!

    drop_table :project_section_images
    ProjectSectionImage.drop_translation_table!

  end

end
