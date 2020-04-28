class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def show
    @review = Review.find(params[:id])
  end

  def new
    shop = Shop.find(session[:shop_id])
    @review = shop.reviews.build
  end

  def create
    shop = Shop.find(session[:shop_id])
    @review = shop.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to @review
    else
      flash[:danger] = "レビューの投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @shop = @review.shop
    @review.destroy
    flash[:success] = "店舗を削除しました"
    redirect_to @shop
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:name, :hardness, :richness, :caramel, :comment, :image)
  end
end
