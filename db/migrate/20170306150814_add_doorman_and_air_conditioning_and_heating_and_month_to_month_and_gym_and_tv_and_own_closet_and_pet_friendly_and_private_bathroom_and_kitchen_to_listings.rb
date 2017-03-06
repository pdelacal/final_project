class AddDoormanAndAirConditioningAndHeatingAndMonthToMonthAndGymAndTvAndOwnClosetAndPetFriendlyAndPrivateBathroomAndKitchenToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :doorman, :string
    add_column :listings, :air_conditioning, :string
    add_column :listings, :heating, :string
    add_column :listings, :month_to_month, :string
    add_column :listings, :gym, :string
    add_column :listings, :tv, :string
    add_column :listings, :own_closet, :string
    add_column :listings, :pet_friendly, :string
    add_column :listings, :private_bathroom, :string
    add_column :listings, :kitchen, :string
  end
end
