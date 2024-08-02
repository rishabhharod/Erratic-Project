class Product < ApplicationRecord
  has_many :reviews
  has_many :orders
  has_many:carts
  belongs_to :seller
end
