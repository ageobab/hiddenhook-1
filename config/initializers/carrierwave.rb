CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: ENV['FOG_PROVIDER'],
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['FOG_REGION']
  }
  config.fog_directory = ENV['FOG_DIRECTORY']
  config.fog_public = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end