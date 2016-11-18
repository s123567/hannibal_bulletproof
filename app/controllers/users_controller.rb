class UsersController < ApplicationController
before_action :find_user, only:[:show]
  def new
    
  end
  def show
    @quote = Quote.new
    @quotes = @user.quotes.all
    if user_signed_in?
      @user = current_user
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
    
  end
end
