require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "root displays the login form when logged out" do
    get root_url

    assert_response :success
    assert_select "form[action='/top/login']"
  end

  test "successful login redirects to the users list" do
    User.create!(uid: "login_user", pass: "password")

    post "/top/login", params: { uid: "login_user", pass: "password" }

    assert_redirected_to users_path
  end
end
