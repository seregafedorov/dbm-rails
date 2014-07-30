class GalleryImageUploader < Md5NameUploader
  version :big_1280x1280 do
    process :resize_to_fill => [1280,1280]
    process :quality => 80
  end
end