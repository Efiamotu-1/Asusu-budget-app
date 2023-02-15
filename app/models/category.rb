class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy, foreign_key: 'category_id'
  has_many :expenses, through: :category_expenses, foreign_key: 'category_id', dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
