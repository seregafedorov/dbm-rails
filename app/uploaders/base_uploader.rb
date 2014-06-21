class BaseUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    uploads_dir = 'uploads'
    [uploads_dir, model.class.to_s.underscore, mounted_as, model.id].join('/')
  end

  def md5
    chunk = model.send(mounted_as)
    @md5 ||= Digest::MD5.hexdigest(chunk.read.to_s)
  end

  def filename
    @name ||= "#{md5}#{File.extname(super)}" if super
  end

end