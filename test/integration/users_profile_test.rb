require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:bob)
    
  end

  test "profile display" do
    get user_path(@user)
    assert_redirected_to '/users/sign_in'
    assert sign_in users(:bob)
    get user_path(@user)
    assert_response :success
    assert_template 'users/show'
    # invalid sumbission
    assert_no_difference 'Quote.count' do
      post quotes_path, params:{quote: {content:""}}
    end
    # valid sumbission
    content = "its a valid quote"
    assert_difference 'Quote.count', 1 do
      post quotes_path, params: {quote: {content: content}}
    assert @user.quotes.first.content == "its a valid quote"
    assert_not @user.quotes.first.content == "its a invalid "
    end

  end
end
