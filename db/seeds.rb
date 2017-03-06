# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = 10.times.map do
  name = Faker::Name.first_name
  user = User.new(
    name: name,
    email: "#{name.downcase}@a.com",
    password: 'asdf',
  )
  user.save
  user
end

users.each do |user|
  puts "name: #{user.name} email: #{user.email}"
end

@user_id = 1
listings = 10.times.map do
  # address = Faker::Address.street_address
  apt_number = Faker::Address.secondary_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zipcode = Faker::Address.zip_code
  listing = Listing.new(
    user_id: @user_id,
    address: "#{Faker::Address.street_address}",
    apt_number: apt_number,
    city: city,
    state: state,
    zipcode: zipcode
  )
  listing.save
  listing
  @user_id += 1
end
# 
# listings.each do |listing|
#   puts "#{listing.address}"
# end
