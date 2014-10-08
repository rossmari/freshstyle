class CreateGoodPictures < ActiveRecord::Migration
  def change
    create_table :good_pictures do |t|
      t.integer :good_id
      t.boolean :main_image

      t.timestamps
    end
  end
end
