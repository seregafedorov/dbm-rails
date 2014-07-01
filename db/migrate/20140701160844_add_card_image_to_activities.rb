class AddCardImageToActivities < ActiveRecord::Migration
  def change

    add_column :activities, :card_image, :text

  end
end
