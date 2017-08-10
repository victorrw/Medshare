# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 200, height: 200, crop: :thumb, gravity: :face
  end

  version :resize do
    cloudinary_transformation effect: "brightness:0", radius: 20,
      width: 200, height: 200, crop: :thumb, gravity: :face
  end
end
