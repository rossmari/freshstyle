class AddAttachmentPictureToGoodPictures < ActiveRecord::Migration
  def self.up
    change_table :good_pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :good_pictures, :picture
  end
end
