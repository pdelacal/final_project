require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :user => nil,
        :address => "Address",
        :rent => "Rent",
        :amenities => "Amenities",
        :rules => "Rules",
        :photo => "Image Url",
        :description => "MyText"
      ),
      Listing.create!(
        :user => nil,
        :address => "Address",
        :rent => "Rent",
        :amenities => "Amenities",
        :rules => "Rules",
        :photo => "Image Url",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Rent".to_s, :count => 2
    assert_select "tr>td", :text => "Amenities".to_s, :count => 2
    assert_select "tr>td", :text => "Rules".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
