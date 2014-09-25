class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  # == REFERENCES
  has_many :goods, dependent: :nullify

  # == VALIDATORS
  validates :name, presence: true
end
