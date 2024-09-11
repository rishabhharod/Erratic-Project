class Seller < ApplicationRecord
    belongs_to :user
    has_many :products

    validates_presence_of :company_email, :GSTIN_number, :contact, :category ,:user_id
    validates :GSTIN_number, format: {with: /\A[A-Za-z0-9]*{15}\z/, message: 'No special characters.'}
    validates :contact, length: {is: 10}
end
