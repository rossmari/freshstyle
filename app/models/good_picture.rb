class GoodPicture < ActiveRecord::Base

  # == REFERENCES
  belongs_to :good

  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/good_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/good_pictures/:id/:style_:basename.:extension',
                    :styles => { admin_thumb: 'x100', big: '360x550>', preview: '80x', list: '220x', basket: 'x200'  }

  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, content_type: /\Aimage/
end
