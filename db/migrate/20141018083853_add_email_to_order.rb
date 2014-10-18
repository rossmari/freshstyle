class AddEmailToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :email, :string
  end
end
