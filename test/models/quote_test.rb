require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # include Devise::Test::ControllerHelpers

  # test "the truth" do
  #   assert true
  # end

  def setup
  	@quote = Quote.new(content:"")
  	@quote_big = Quote.new(content:"a"*156)
    @user = User.create!(email:"joe@joe.com", password: 'testtest')
    @quote_valid = Quote.new(content:'dhfgdfdf', user_id: @user.id)
    @quote_to_user = @user.quotes.build(content: "ghghhg")
  end

  test "a quote without content should be invalid" do
  	
  	assert_not @quote.valid?
  end

  test "a quote withmore than 140 char should be invalid" do
  	@quote_big 
  	assert_not @quote_big.valid?
  end

  test "a quote with < 140 char et no user should be valid" do
    @quote_valid.user_id = nil
    assert_not @quote_valid.valid?
  end

  test "a quote with < 140 char and user should be valid" do
    assert @quote_valid.valid?
  end

  test "a quote should be automatically assigned to a user" do
    assert @quote_to_user.valid?
  end

  test "a user ID should be present on the quote creation" do
    @quote_to_user.user_id = nil
    assert_not @quote_to_user.valid?
  end

  test "delete action should decrease Quote.count" do
        assert_difference 'Quote.count' do
          delete @quote_valid
        end
  end


end
