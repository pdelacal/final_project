class Listing < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :city, :state, :zipcode

  mount_uploader :image_url
end
