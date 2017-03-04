class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  version :thumb do
    process :resize_to_fill => [50, 50]
  end
  version :full do
    process :resize_to_fill => [200, 200]
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
  %w(jpg jpeg png gif)
end

end
