class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :products
end
