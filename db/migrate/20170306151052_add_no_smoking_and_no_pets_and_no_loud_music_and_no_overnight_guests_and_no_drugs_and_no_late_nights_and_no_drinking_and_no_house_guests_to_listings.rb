class AddNoSmokingAndNoPetsAndNoLoudMusicAndNoOvernightGuestsAndNoDrugsAndNoLateNightsAndNoDrinkingAndNoHouseGuestsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :no_smoking, :string
    add_column :listings, :no_pets, :string
    add_column :listings, :no_loud_music, :string
    add_column :listings, :no_overnight_guests, :string
    add_column :listings, :no_drugs, :string
    add_column :listings, :no_late_nights, :string
    add_column :listings, :no_drinking, :string
    add_column :listings, :no_house_guests, :string
  end
end
