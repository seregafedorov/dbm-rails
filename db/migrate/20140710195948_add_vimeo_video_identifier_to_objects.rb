class AddVimeoVideoIdentifierToObjects < ActiveRecord::Migration
  def change
    add_column :activities, :vimeo_video_str, :text
    add_column :project_sections, :vimeo_video_str, :text
  end
end
