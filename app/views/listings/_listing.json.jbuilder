json.extract! listing, :id, :user_id, :address, :rent, :amenities, :rules, :photo, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
