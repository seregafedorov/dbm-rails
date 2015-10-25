class CreatePopupImages < ActiveRecord::Migration
  def change
    create_table :popup_images do |t|
      t.integer :position
      t.text :image
      t.references :popup_imageable, polymorphic: true
      t.timestamps
    end
  end
end
