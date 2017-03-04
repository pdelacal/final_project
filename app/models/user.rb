class User < ApplicationRecord
  has_secure_password

  # responses
  has_many :responses

  # friends
  has_and_belongs_to_many :friends,
             class_name: "User",
             join_table: :friendships,
             foreign_key: :user_id,
             association_foreign_key: :friend_user_id
  has_and_belongs_to_many :requests_from,
              class_name: "User",
              join_table: :requests_from,
              foreign_key: :from_user_id,
              association_foreign_key: :to_user_id
  has_and_belongs_to_many :requests_to,
              class_name: "User",
              join_table: :requests_to,
              foreign_key: :to_user_id,
              association_foreign_key: :from_user_id

  # facebook
  def self.create_from_facebook(auth)
  User.create!(
    facebook_id: auth['uid'],
    name: auth['info']['name'],
    email: auth['info']['email'],
    user_likes: auth['info']['user_likes']
  )
  end

end
