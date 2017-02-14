CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                               # required
    aws_access_key_id:     'AKIAJIS54DFU2KHZI32Q',                              # required
    aws_secret_access_key: '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',                              # required
    region:                'ap-northeast-2',                                         # optional, defaults to 'us-east-1'
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com'            # optional, defaults to nil
  }
  config.fog_directory  = 'palette160829111'                                   # required
  config.fog_public     = true                                                 # optional, defaults to true
end