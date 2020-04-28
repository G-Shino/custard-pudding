class FavoritesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    current_user.favorite(review)
    flash[:success] = "食べたい！に登録しました"
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    review = Review.find(params[:review_id])
    current_user.unfavorite(review)
    flash[:success] = "食べたい！から削除しました"
    redirect_back(fallback_location: root_path)
  end
end
