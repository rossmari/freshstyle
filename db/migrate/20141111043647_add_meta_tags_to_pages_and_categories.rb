class AddMetaTagsToPagesAndCategories < ActiveRecord::Migration
  def change
    add_column :categories, :meta_tags, :text
    add_column :pages, :meta_tags, :text
  end
end
