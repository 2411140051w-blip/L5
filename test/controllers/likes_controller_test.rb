require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "creating the same like more than once keeps a single record" do
    user = User.create!(uid: "liker", pass: "password")
    tweet = Tweet.create!(user: user, message: "Hello")
    post "/top/login", params: { uid: user.uid, pass: "password" }

    2.times { post likes_url, params: { tweet_id: tweet.id } }

    assert_response :redirect
    assert_equal 1, Like.where(user: user, tweet: tweet).count
  end
end
