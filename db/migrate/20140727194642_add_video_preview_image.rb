class AddVideoPreviewImage < ActiveRecord::Migration
  def change
    add_column :activities, :preview_video_image, :text
  end
end
