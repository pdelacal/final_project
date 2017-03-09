class RemoveAptPic2FromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :photo, :string
    remove_column :listings, :photo_file_name, :string
    remove_column :listings, :photo_content_type, :string
    remove_column :listings, :photo_file_size, :string
    remove_column :listings, :photo_updated_at, :string
  end
end
