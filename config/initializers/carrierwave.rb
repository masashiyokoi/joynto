# /config/initializers/carrierwave.rb
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  config.storage = :fog # キャッシュにS3を指定
  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['JOYNTO_AWS_KEY_ID'],
    aws_secret_access_key: ENV['JOYNTO_AWS_SECRET'],
    region: 'ap-northeast-1',  # Tokyoの場合
  }

end
