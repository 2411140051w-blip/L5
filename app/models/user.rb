class User < ApplicationRecord
    has_many :tweets, dependent: :destroy #ユーザを消すとツイートも消える
    has_many :likes, dependent: :destroy #ユーザを消すといいねも消える
    has_many :like_tweets, through: :likes, source: :tweet
    has_secure_password

    validates :uid, presence: true, uniqueness: true
    
    def password=(raw_password)
        self[:password_digest] = BCrypt::Password.create(raw_password).to_s
    end
end
