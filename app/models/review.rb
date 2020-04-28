class Review < ApplicationRecord
  validates :name, presence: true
  validates :hardness, presence: true
  validates :richness, presence: true
  validates :caramel, presence: true
  validates :image, presence: true
  
  belongs_to :user
  belongs_to :shop
  has_one_attached :image
  has_many :favorites
end
