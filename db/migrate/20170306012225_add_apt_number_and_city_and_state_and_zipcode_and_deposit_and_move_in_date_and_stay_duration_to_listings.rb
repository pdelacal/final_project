class AddAptNumberAndCityAndStateAndZipcodeAndDepositAndMoveInDateAndStayDurationToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :apt_number, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :zipcode, :string
    add_column :listings, :deposit, :string
    add_column :listings, :move_in_date, :string
    add_column :listings, :stay_duration, :string
  end
end
