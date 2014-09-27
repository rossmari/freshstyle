require 'RMagick'
include Magick

class Cropper

  def initialize(image_path)
    @image_path = image_path
  end

  def process(x, y, width, height)
    image = ImageList.new(@image_path)
    croped_image = image.crop(x.to_i, y.to_i, width.to_i, height.to_i)

    rr = Regexp.new(/(\S+\/)\S+_(\S+)/)
    file_name = @image_path.match(rr)[1] + 'cropped_' + @image_path.match(rr)[2]

    croped_image.write(file_name)
  end
end

