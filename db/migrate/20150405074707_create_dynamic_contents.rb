class CreateDynamicContents < ActiveRecord::Migration
  def self.up
    create_table :dynamic_contents do |t|
      t.string :content_type
      t.timestamps
    end
    add_index :dynamic_contents, :content_type, unique: true
    DynamicContent.create_translation_table! content: :text
  end

  def self.down
    DynamicContent.drop_translation_table!
  end
end
