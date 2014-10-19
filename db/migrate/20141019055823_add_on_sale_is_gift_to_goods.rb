class AddOnSaleIsGiftToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :on_sale, :boolean, default: false
    add_column :goods, :is_gift, :boolean, default: false
  end
end
