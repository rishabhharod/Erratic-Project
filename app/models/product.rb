class Product < ApplicationRecord
  has_many_attached :images
  has_many :reviews
  has_many :orders
  has_many :carts
  has_many :wishlists
  belongs_to :seller
end
