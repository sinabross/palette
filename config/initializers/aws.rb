CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                               # required
    aws_access_key_id:     'AKIAJMUTR5TF2SWGX36A',                              # required
    aws_secret_access_key: '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',          # required
    region:                'eu-west-1',                                         # optional, defaults to 'us-east-1'
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com'            # optional, defaults to nil
  }
  config.fog_directory  = 'fourseasons111112'                                   # required
# config.fog_public     = false                                                 # optional, defaults to true
end