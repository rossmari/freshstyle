class CreateMainOffers < ActiveRecord::Migration
  def change
    create_table :main_offers do |t|
      t.string :header
      t.string :content_text

      t.timestamps
    end
  end
end
