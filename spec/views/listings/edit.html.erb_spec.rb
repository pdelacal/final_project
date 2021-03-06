require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :user => nil,
      :address => "MyString",
      :rent => "MyString",
      :amenities => "MyString",
      :rules => "MyString",
      :photo => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input#listing_user_id[name=?]", "listing[user_id]"

      assert_select "input#listing_address[name=?]", "listing[address]"

      assert_select "input#listing_rent[name=?]", "listing[rent]"

      assert_select "input#listing_amenities[name=?]", "listing[amenities]"

      assert_select "input#listing_rules[name=?]", "listing[rules]"

      assert_select "input#listing_photo[name=?]", "listing[photo]"

      assert_select "textarea#listing_description[name=?]", "listing[description]"
    end
  end
end
