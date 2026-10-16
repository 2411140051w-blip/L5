class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet

    validates :uid, presence: true, uniqueness: true
    
    def pass=(raw_password)
        self[:pass] = BCrypt::Password.create(raw_password).to_s
    end
end
