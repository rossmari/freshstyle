class Carousel < ActiveRecord::Base

  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/carousel_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/carousel_pictures/:id/:style_:basename.:extension',
                    :styles => { admin_thumb: '100x100#', main_thumb: 'x500' }

  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage/


end
