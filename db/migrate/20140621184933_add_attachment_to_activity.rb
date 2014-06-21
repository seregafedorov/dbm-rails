class AddAttachmentToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :attachment, :text
  end
end
