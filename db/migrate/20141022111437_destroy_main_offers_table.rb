class DestroyMainOffersTable < ActiveRecord::Migration

  def self.up
    drop_table :main_offers
  end

end
