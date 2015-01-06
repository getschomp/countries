CarrierWave.configure do |config|
  config.fog_credentials = {

    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID']|| '',                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']|| ''                        # required
  }
  config.fog_directory  = ENV['S3_BUCKET']|| ''                                       # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end