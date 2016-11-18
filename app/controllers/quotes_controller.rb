class QuotesController < ApplicationController

  def create
    @quote = current_user.quotes.build(quote_params)
    @user = current_user
    if @quote.save
      @quote.user = current_user
      flash[:success] = 'Quote created'
      redirect_to @user
    else
      render 'pages/home'
    end
  end

  def destroy
    @user = current_user
    @quote = Quote.find(params[:id])
    @quote.destroy
    if @quote.destroy
      redirect_to @user
    else
      render 'pages/error'
    end
  end

  private
  def quote_params
    params.require(:quote).permit(:content, :user_id)
    
  end
end
