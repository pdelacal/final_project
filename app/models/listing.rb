class Listing < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :city, :state, :zipcode
  has_many :listingphotos
end
