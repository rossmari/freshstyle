class CreateSize < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end

    create_table :goods_sizes do |t|
      t.integer :good_id
      t.integer :size_id
      t.timestamps
    end
  end
end
