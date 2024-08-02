class Invoice < ApplicationRecord
  belongs_to :order
  belongs_to :user
  belongs_to :seller
end
