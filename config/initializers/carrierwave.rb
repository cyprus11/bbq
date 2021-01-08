if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_acces_key_id: Rails.application.credentials.aws[:s3_access_key],
      aws_acces_access_key: Rails.application.credentials.aws[:s3_secret_key],
      region: Rails.application.credentials.aws[:s3_region_name]
    }

    config.fog_directory = Rails.application.credentials.aws[:s3_bucket_name]
  end
end
