class Address < ApplicationRecord
    validates_presence_of : first_name, last_name, birthday, sex,home, message: "This field shouldn't be blank"
    has_many :orders
    belongs_to :order
end
