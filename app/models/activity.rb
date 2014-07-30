class Activity < ActiveRecord::Base

  has_many :gallery_images, as: :gallery_imageable

  extend FriendlyId

  friendly_id :slugged_url, use: [:slugged, :history]

  translates :name, :heading, :description, :link, :link_text
  active_admin_translates :name, :heading, :description, :link, :link_text


  mount_uploader :attachment, UnchangedNameUploader
  mount_uploader :card_image, CardImageUploader
  mount_uploader :preview_video_image, GalleryImageUploader

  default_scope -> { order(:position, :updated_at)}


  accepts_nested_attributes_for :gallery_images, allow_destroy: true


  def first_gallery_image
    gallery_images.first
  end

end
