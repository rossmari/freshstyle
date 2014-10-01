class AddAttachmentPictureToCarousels < ActiveRecord::Migration
  def self.up
    change_table :carousels do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :carousels, :picture
  end
end
