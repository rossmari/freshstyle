class ChangeMainImageFieldInGoodPictures < ActiveRecord::Migration
  def change
    change_column :good_pictures, :main_image, :boolean, default: false, nil: false
  end
end
