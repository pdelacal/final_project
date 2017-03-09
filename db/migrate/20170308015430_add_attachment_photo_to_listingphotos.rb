class AddAttachmentPhotoToListingphotos < ActiveRecord::Migration
  def self.up
    change_table :listingphotos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :listingphotos, :photo
  end
end
