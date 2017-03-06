require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :user => nil,
      :address => "MyString",
      :rent => "MyString",
      :amenities => "MyString",
      :rules => "MyString",
      :image_url => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input#listing_user_id[name=?]", "listing[user_id]"

      assert_select "input#listing_address[name=?]", "listing[address]"

      assert_select "input#listing_rent[name=?]", "listing[rent]"

      assert_select "input#listing_amenities[name=?]", "listing[amenities]"

      assert_select "input#listing_rules[name=?]", "listing[rules]"

      assert_select "input#listing_image_url[name=?]", "listing[image_url]"

      assert_select "textarea#listing_description[name=?]", "listing[description]"
    end
  end
end
