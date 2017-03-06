require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :user => nil,
      :address => "Address",
      :rent => "Rent",
      :amenities => "Amenities",
      :rules => "Rules",
      :image_url => "Image Url",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Rent/)
    expect(rendered).to match(/Amenities/)
    expect(rendered).to match(/Rules/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/MyText/)
  end
end
