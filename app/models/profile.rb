class Profile < ActiveRecord::Base
  extend FriendlyId
  translates :name, :tags, :description, :surname, :credit

  friendly_id :slugged_url, use: [:slugged, :history]

  active_admin_translates :name, :tags, :description, :surname, :credit

  mount_uploader :photo, CardImageUploader

  default_scope -> { order(:position) }

  def tags_array
    if !tags.blank?
      tags.split(',').map { |s| s.strip }
    else
      []
    end
  end

end