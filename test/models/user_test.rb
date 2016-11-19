require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    bob = users(:bob)
    joe = users(:joe)
    assert_not bob.following?(joe)
    bob.follow(joe)
    assert bob.following?(joe)
    assert joe.followers.include?(bob)
    bob.unfollow(joe)
    assert_not bob.following?(joe)
  end
end
