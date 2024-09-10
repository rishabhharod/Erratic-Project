class Address < ApplicationRecord
    validates_presence_of :full_address, :state, :city, :pincode, :landmark, :user_id, :address_type
    validates :pincode, length: {is: 6}
    has_many :orders
    belongs_to :order
end
