class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title, null: false
      t.string :article
      t.string :color
      t.text :consist
      t.string :season
      t.integer :count_in_stock
      t.integer :price
      t.integer :percents_discount
      t.integer :monetary_discount
      t.references :brand
      t.references :category
      t.references :origin_country
      t.references :design_country

      t.timestamps
    end
  end
end
