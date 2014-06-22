class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.integer :position
      t.text :image
      t.references :gallery_imageable, polymorphic: true
      t.timestamps
    end
  end
end
