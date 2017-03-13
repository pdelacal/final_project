class RemoveMoveInDateFromListing < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :move_in_date, :string
  end
end
