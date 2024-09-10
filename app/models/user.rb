class User < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :addresses
  has_one :cart
  has_one :wishlist
  has_one :seller
  has_one_attached :profile
  validates_presence_of :name, :gender, :contact
  validates :contact, length: {is: 10}

  after_initialize :set_default_role, if: :new_record?
  
  enum role: %i[buyer seller admin]

  def set_default_role
    self.role ||= :buyer
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end