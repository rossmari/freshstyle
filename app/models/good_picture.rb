class GoodPicture < ActiveRecord::Base

  # == REFERENCES
  belongs_to :good


  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/good_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/good_pictures/:id/:style_:basename.:extension',
                    :styles => { admin_thumb: '100x100#', big: '550x550>', preview: '80x', list: '220x' }

  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage/

end
