class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops
  has_many :reviews
  has_many :favorites
  has_many :favorite_reviews, through: :favorites, source: :review
  
  def favorite(review)
    self.favorites.find_or_create_by(review_id: review.id)
  end
  
  def unfavorite(review)
    favorite = self.favorites.find_by(review_id: review.id)
    favorite.destroy if favorite
  end
  
  def favorite?(review)
    self.favorite_reviews.include?(review)
  end
end
