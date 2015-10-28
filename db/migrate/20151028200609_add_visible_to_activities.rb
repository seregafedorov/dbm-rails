class AddVisibleToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :visible, :boolean, default: true
  end
end
