class Review < ApplicationRecord
  has_many :users
  belongs_to :product
  belongs_to :order
end
