class AddTranslationsToActivity < ActiveRecord::Migration
  def self.up
    Activity.create_translation_table!({
                                           :name => :text,
                                           :heading => :text,
                                           :description => :text,
                                           :link => :text,
                                           :link_text => :text
                                       }, {
                                           :migrate_data => true
                                       })
  end

  def self.down
    Activity.drop_translation_table! :migrate_data => true
  end
end
