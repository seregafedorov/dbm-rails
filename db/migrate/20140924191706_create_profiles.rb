class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.text :slugged_url
      t.text :slug
      t.text :photo
      t.timestamps
    end
    Profile.create_translation_table! name: :text, tags: :text, description: :text

  end

  def self.down
    drop_table :profiles
    Profile.drop_translation_table!
  end
end
