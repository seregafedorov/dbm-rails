class GalleryImage < ActiveRecord::Base

  belongs_to :gallery_imageable, polymorphic: true

  mount_uploader :image, BaseUploader


end