CarrierWave.configure do |config|
  config.aliyun_access_id = ENV['ALIYUN_ACCESS_ID']
  config.aliyun_access_key = ENV['ALIYUN_ACCESS_KEY']
  config.aliyun_internal = false
  config.aliyun_area = 'cn-hangzhou'
  config.aliyun_bucket = if Rails.env.production?
                           'reading-now-app'
                         else
                           'reading-now-app-dev'
                         end
end
