class Profile < ActiveRecord::Base
  extend FriendlyId
  translates :name, :tags, :description

  friendly_id :slugged_url, use: [:slugged, :history]

  active_admin_translates :name, :tags, :description

  mount_uploader :photo, CardImageUploader



end