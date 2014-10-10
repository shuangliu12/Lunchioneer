# encoding: utf-8

class KitchenPhotoUploader < CarrierWave::Uploader::Base
if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "https://s3-us-west-2.amazonaws.com/lunchioneer-development/1.jpg"
  end

end
