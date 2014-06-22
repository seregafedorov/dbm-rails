class Activity < ActiveRecord::Base


  mount_uploader :attachment, BaseUploader


  has_many :gallery_images, as: :gallery_imageable


  accepts_nested_attributes_for :gallery_images
end
