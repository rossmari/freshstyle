class Category < ActiveRecord::Base
  include TheSortableTree::Scopes

  acts_as_nested_set

  # == REFERENCES
  has_many :goods, dependent: :nullify

  # == VALIDATORS
  validates :name, presence: true

end
