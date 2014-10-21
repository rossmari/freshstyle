require 'RMagick'
include Magick

class Cropper

  def initialize(image_path)
    @image_path = image_path
  end

  def process(x, y, width, height)
    image = ImageList.new(@image_path)
    croped_image = image.crop(x.to_i, y.to_i, width.to_i, height.to_i)
    croped_image.write(@image_path.gsub(/original\_/, 'cropped_'))
  end
end

