class User < ApplicationRecord
  has_many :products
  has_many :orders
  has_one :cart
  validates :name, presence: true
  validates :gender, presence: true
  validates :contact, length: {is: 10}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end