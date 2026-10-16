require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can like a tweet" do
    user = User.create!
    tweet = Tweet.create!(user: user)

    user.like_tweets << tweet

    assert_equal [tweet], user.like_tweets
    assert_equal [user], tweet.like_users
  end
end
