class RemoveAptPicFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :photo, :string
  end
end
