class UsersController < ApplicationController
before_action :find_user, only:[:show, :following, :followers]
  def new
    
  end
  def show
    @quote = Quote.new
    @users = User.all
    # if user_signed_in?
    #   @user = current_user
    # end
    @quotes = @user.quotes.all
    @total_quotes = Quote.all.paginate(:page => params[:page], :per_page => 20)
  end

  def following
    @title = 'following'

    @users = @user.following
    render 'show_follow'
    
  end

  def followers
    @title = "Followers"

    @users = @user.followers
    render 'show_follow'
  end

  private
  def find_user
    @user = User.find(params[:id])
    
  end
end
