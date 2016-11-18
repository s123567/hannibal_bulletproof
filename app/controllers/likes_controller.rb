class LikesController < ApplicationController
  def create
    quote = Quote.find(params[:quote_id])
    quote.likes.create! user: current_user
    redirect_to current_user

    
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to current_user
    
  end
end
