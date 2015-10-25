class PopupImage < ActiveRecord::Base

  belongs_to :popup_imageable, polymorphic: true

  mount_uploader :image, PopupImageUploader


end