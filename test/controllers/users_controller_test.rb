require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index displays users" do
    get users_url

    assert_response :success
    assert_select "p", text: "ユーザー名：user_one"
    assert_select "p", text: "ユーザー名：user_two"
  end

  test "index displays tweet author's username" do
    user = User.create!(uid: "Poster", pass: "password")
    Tweet.create!(user: user, message: "Hello")

    get users_url

    assert_response :success
    assert_select "p", text: "投稿者：Poster"
  end

  test "does not allow registering a duplicate uid" do
    post users_url, params: { user: { uid: "user_one", pass: "password" } }

    assert_response :unprocessable_entity
    assert_select "li", text: "Uid has already been taken"
    assert_equal 2, User.count
  end
end
