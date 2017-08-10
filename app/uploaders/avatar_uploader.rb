class AvatarUploader < ImageUploader
  def default_url(*_args)
    # TODO 没有找到更好的方法得到 host, 暂时写死 CarrierWave::Aliyun::Bucket
    host = aliyun_host || "https://#{aliyun_bucket}.oss-#{aliyun_area}.aliyuncs.com"
    "#{host}/default_avatar.png"
  end
end
