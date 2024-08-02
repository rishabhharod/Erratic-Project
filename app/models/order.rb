class Order < ApplicationRecord
  has_many :order_items
  has_one :address
  belongs_to :user
end
