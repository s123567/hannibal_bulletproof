require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@quote = Quote.new(content:"")
  	@quote_big = Quote.new(content:"a"*156)
  end

  test "a quote without content should be invalid" do
  	
  	assert_not @quote.valid?
  end

  test "a quote withmore than 140 char should be invalid" do
  	
  	assert_not @quote_big.valid?
  end


end
