json.extract! listing, :id, :user_id, :address, :rent, :amenities, :rules, :image_url, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
