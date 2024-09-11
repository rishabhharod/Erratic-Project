class Address < ApplicationRecord
  has_many :orders
  belongs_to :order

  validates_presence_of :full_address, :state, :city, :pincode, :landmark, :address_type
  validates :pincode, length: {is: 6}
end
