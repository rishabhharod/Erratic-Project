class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy 
  has_many :reviews, dependent: :destroy 
  has_many :orders
  has_many :cart_items ,dependent: :destroy 
  has_many :wishlist_items, dependent: :destroy 
  belongs_to :seller

  validates_presence_of :name, :description, :price, :stock, :product_type
  validates :description, length: {maximum: 200, message: 'Product description would be under 200.'}
end
