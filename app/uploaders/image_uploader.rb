class ImageUploader < CarrierWave::Uploader::Base
  storage :aliyun

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def filename
    return if super.blank?
    model.uploader_secure_token ||= SecureRandom.uuid.delete("-")
    Rails.logger.debug("(BaseUploader.filename) #{model.uploader_secure_token}")
    "#{model.uploader_secure_token}.#{file.extension.downcase}"
  end

  ALLOWED_VERSION_NAME = %w[tiny lg md sm xs large].freeze

  def url(version_name = nil)
    @url ||= super({})
    version_name = version_name.to_s
    return @url unless version_name && version_name.in?(ALLOWED_VERSION_NAME)
    [@url, version_name].join('!')
  end
end
