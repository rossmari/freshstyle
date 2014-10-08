class CreateOrderGoods < ActiveRecord::Migration
  def change
    create_table :order_goods do |t|
      t.integer :order_id
      t.integer :good_id

      t.timestamps
    end
  end
end
