class MainUploader < CarrierWave::Uploader::Base

  def secure_token
    UUIDTools::UUID.timestamp_create
  end

end