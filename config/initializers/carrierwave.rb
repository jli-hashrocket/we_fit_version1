CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: "AKIAI3NWUDVRLQVKJIIA",
    aws_secret_access_key: "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"
  }
  config.fog_directory  = "wefit-#{Rails.env}"
end
