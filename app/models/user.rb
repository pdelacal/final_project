class User < ApplicationRecord
  has_secure_password
  has_many :responses
  validates :email, uniqueness: {case_sensitive: false}
  has_one :listing

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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
