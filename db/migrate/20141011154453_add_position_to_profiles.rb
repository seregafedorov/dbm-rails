class AddPositionToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :position, :integer, default: 0
  end
end
