# /config/initializers/carrierwave.rb
CarrierWave.configure do |config|

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['PLOAK_AWS_KEY_ID'],
    aws_secret_access_key: ENV['PLOAK_AWS_SECRET'],
    region: 'ap-northeast-1',  # Tokyoの場合
  }
  config.cache_storage = :fog # キャッシュにS3を指定

end
