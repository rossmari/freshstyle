class AddMetaTitleToPagesAndCategories < ActiveRecord::Migration
  def change
    add_column :categories, :meta_title, :string
    add_column :pages, :meta_title, :string
  end
end
