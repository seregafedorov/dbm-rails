class PopupImageUploader < Md5NameUploader
  version :big_370x728 do
    process :resize_to_fill => [370, 728]
    process :quality => 80
  end

  version :medium_157x388 do
    process :resize_to_fill => [157, 388]
    process :quality => 80
  end

  def store_dir
    uploads_dir = 'uploads'
    [uploads_dir, model.class.to_s.underscore, mounted_as].join('/')
  end

end