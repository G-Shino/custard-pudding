class Shop < ApplicationRecord
  validates :name, presence: true
  validates :kind, presence: true
  validates :address, presence: true
  validates :holiday, presence: true
  validates :image, presence: true
 
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :image
end
