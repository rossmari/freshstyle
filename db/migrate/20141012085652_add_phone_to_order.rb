class AddPhoneToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :phone, :string
  end

  def down
    remove_column :orders, :phone
  end
end
