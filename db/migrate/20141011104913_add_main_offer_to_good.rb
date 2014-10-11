class AddMainOfferToGood < ActiveRecord::Migration
  def up
    add_column :goods, :main_offer, :boolean, default: false
  end

  def down
    remove_column :goods, :main_offer
  end
end
