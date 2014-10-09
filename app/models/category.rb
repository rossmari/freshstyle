class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  # == REFERENCES
  has_many :goods, dependent: :nullify

  # == VALIDATORS
  validates :name, presence: true

  # == RESOURCES
  has_attached_file :picture,
                    :url  => '/category_pictures/:id/:style_:basename.:extension',
                    :path => ':rails_root/public/category_pictures/:id/:style_:basename.:extension',
                    :styles => { admin: '100x100#', icon: '300x300#'}

  # == VALIDATORS
  #validates_attachment_presence :picture
  #validates_attachment_content_type :picture, :content_type => /\Aimage/

end
