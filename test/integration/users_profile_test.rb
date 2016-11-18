require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:bob)
    
  end

  test "profile display" do
    get user_path(@user)
    assert_redirected_to '/users/sign_in'
    # post new_user_session_path, params: {email: @user.email, password: 'testtest'}
    # assert_template 'users/show'
    # assert_match @user.quotes
  end
end
