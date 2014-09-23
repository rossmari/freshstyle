class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  validates_presence_of :name

end
