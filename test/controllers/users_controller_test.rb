require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index displays users" do
    get users_url

    assert_response :success
    assert_select "p", text: "ユーザー名：MyString", count: 2
  end
end
