class CreateListingphotos < ActiveRecord::Migration[5.0]
  def change
    create_table :listingphotos do |t|

      t.timestamps
    end
  end
end
