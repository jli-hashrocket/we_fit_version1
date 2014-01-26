CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: "AKIAI2VHXMEWZXAQVRYA",
    aws_secret_access_key: "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"
  }
  config.fog_directory  = "wefit-#{Rails.env}"
end
