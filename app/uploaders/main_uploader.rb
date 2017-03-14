class MainUploader < CarrierWave::Uploader::Base

=begin
  def secure_token
    UUIDTools::UUID.timestamp_create
  end
=end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end