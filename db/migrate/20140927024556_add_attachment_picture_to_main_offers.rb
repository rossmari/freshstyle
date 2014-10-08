class AddAttachmentPictureToMainOffers < ActiveRecord::Migration
  def self.up
    change_table :main_offers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :main_offers, :picture
  end
end
