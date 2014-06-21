class AddLinkTextToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :link_text, :text
  end
end
