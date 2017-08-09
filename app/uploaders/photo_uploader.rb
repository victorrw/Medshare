# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end
end
