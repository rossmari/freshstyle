class GoodPicture < ActiveRecord::Base

  # == REFERENCES
  belongs_to :good


  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/good_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/good_pictures/:id/:style_:basename.:extension',
                    :styles => { admin_thumb: '100x100#', main_thumb: '400x300#' }

  # == VALIDATORS
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage/

end
