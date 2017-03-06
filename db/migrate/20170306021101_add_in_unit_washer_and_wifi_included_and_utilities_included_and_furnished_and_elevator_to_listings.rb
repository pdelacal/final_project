class AddInUnitWasherAndWifiIncludedAndUtilitiesIncludedAndFurnishedAndElevatorToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :in_unit_washer, :string
    add_column :listings, :wifi_included, :string
    add_column :listings, :utilities_included, :string
    add_column :listings, :furnished, :string
    add_column :listings, :elevator, :string
  end
end
