class RemoveCategoryImage < ActiveRecord::Migration

  def self.up
    remove_attachment :categories, :picture
  end

  def self.down
    add_attachment :categories, :picture
  end

end
