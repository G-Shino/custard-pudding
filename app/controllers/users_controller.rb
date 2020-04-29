class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorite_reviews = @user.favorite_reviews
  end
  
  def myshops
    @user = User.find(params[:id])
    @myshops = @user.shops
  end
  
  def myreviews
    @user = User.find(params[:id])
    @myreviews = @user.reviews
  end
end
