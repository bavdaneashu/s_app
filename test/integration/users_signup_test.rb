require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count', 1 do
      post users_path, user: { name:  "Example User",
                               email: "user@example",
                               password:              "password",
                               password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end