class AddMoveInDayFromListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :move_in_day, :string
  end
end
