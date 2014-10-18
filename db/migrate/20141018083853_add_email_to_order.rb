class AddEmailToOrder < ActiveRecord::Migration

  def up
    add_column :orders, :email, :string
  end

  def down
    remove_column :orders, :email
  end

end
