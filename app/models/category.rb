class Category < ActiveRecord::Base
  include TheSortableTree::Scopes

  acts_as_nested_set

  # == REFERENCES
  has_many :goods, dependent: :nullify

  # == RESOURCES
  has_attached_file :picture,
                    url: '/category_pictures/:id/:style_:basename.:extension',
                    path: ':rails_root/public/category_pictures/:id/:style_:basename.:extension',
                    styles: { admin: '100x100#', icon: '300x300#' }

  # == VALIDATORS
  validates :name, presence: true

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
