CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAJENM62SN3JCPPW5Q",
      :aws_secret_access_key  => "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"
      :region                 => "ireland"
  }
  config.fog_directory  = "fondatelier"
end