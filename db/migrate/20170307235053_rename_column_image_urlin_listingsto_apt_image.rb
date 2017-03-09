class RenameColumnImageUrlinListingstoAptImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :photo, :photo
  end
end
