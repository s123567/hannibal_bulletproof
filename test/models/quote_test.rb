require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@quote = Quote.new(content:"")
  	@quote_big = Quote.new(content:"a"*156)
    @user = User.create!(email:"joe@joe.com", password: 'testtest')
    @quote_valid = Quote.new(content:'dhfgdfdf', user_id: @user.id)
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

  test "a quote with < 140 char et user should be valid" do
    assert @quote_valid.valid?
  end


end
