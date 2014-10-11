class AddSizeToOrderGood < ActiveRecord::Migration
  def up
    add_column :order_goods, :size_id, :integer
  end
  def down
    remove_column :order_goods, :size_id
  end
end
