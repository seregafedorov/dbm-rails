class BaseUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    uploads_dir = 'uploads'
    [uploads_dir, model.class.to_s.underscore, mounted_as, model.id].join('/')
  end

end