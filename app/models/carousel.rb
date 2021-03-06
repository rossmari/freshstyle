class Carousel < ActiveRecord::Base

  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/carousel_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/carousel_pictures/:id/:style_:basename.:extension',
                    :styles => { small: '150x', large: '500x500>', cropped: '' }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage/

  # == BEFORE FILTERS
  before_save :refresh_main

  def picture_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(picture.path(style))
  end

  def crop_image
    cropper = Cropper.new(self.picture.path)
    cropper.process(crop_x, crop_y, crop_w, crop_h)
  end

  private

  def refresh_main
    if self.main
      Carousel.where('id != ?', self.id).update_all(main: false)
    end
  end
end
