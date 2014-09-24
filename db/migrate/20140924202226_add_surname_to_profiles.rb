class AddSurnameToProfiles < ActiveRecord::Migration
  def change
    add_column :profile_translations, :surname, :text
  end
end
