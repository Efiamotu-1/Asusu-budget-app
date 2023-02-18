class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
