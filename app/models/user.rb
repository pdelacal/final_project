class User < ApplicationRecord
  has_secure_password

  # responses
  has_many :responses
  validates :email, uniqueness: {case_sensitive: false}
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
    password: "facebook"

    # user_likes: auth['info']['user_likes']
  )
  end

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

  def compare_to(user)
    @matches = 0
    @current_resp = self.responses.last.attributes
    @compare_resp = user.responses.last.attributes
    @current_resp.each do |my_response|
      @compare_resp.each do |compare_response|
        if my_response == compare_response
          p "Match!"
          @matches += 1
        end
      end
    end
    p @matches
  end

  
end
