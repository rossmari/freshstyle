class GoodPicture < ActiveRecord::Base

  # == REFERENCES
  belongs_to :good

  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/good_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/good_pictures/:id/:style_:basename.:extension',
                    :styles => {
                        admin_thumb: 'x100',
                        big: {
                            geometry: '360x550>',
                            watermarks: [
                                {
                                    path: 'watermarks/watermark.png',
                                    gravity: 'SouthEast',
                                    transparency: '60%'
                                }
                            ],
                            processors: [:thumbnail, :watermark_processor]
                        },
                        original_watermarked: {
                            watermarks: [
                                {
                                    path: 'watermarks/watermark.png',
                                    gravity: 'SouthEast',
                                    transparency: '60%'
                                }
                            ],
                            processors: [:thumbnail, :watermark_processor]
                        },
                        preview: '80x',
                        list: '220x',
                        basket: {
                            geometry: 'x200',
                            watermarks: [
                                {
                                    path: 'watermarks/watermark.png',
                                    gravity: 'SouthEast',
                                    transparency: '60%'
                                }
                            ],
                            processors: [:thumbnail, :watermark_processor]
                        },

                    }




  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, content_type: /\Aimage/
end
