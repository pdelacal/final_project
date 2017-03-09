class AddListingToListingphoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :listingphotos, :listing, foreign_key: true
  end
end
