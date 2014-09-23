class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title, null: false
      t.text :description
      t.references :country

      t.timestamps
    end
  end
end
