class AddDataToOrder < ActiveRecord::Migration

  def up
    add_column :orders, :name, :string
    add_column :orders, :family, :string
    add_column :orders, :second_name, :string
    add_column :orders, :city, :string
    add_column :orders, :post_index, :string
    add_column :orders, :street, :string
  end

  def down
    remove_column :orders, :name
    remove_column :orders, :family
    remove_column :orders, :second_name
    remove_column :orders, :city
    remove_column :orders, :post_index
    remove_column :orders, :street
  end

end
