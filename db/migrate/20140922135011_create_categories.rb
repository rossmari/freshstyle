class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.

      t.timestamps
    end

    add_index :categories, :rgt
    add_index :categories, :parent_id
  end

  def self.down
    drop_table :categories
  end
end