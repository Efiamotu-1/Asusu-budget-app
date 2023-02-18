class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, foreign_key: 'expense_id', dependent: :destroy
  has_many :categories, through: :category_expenses, foreign_key: 'expense_id'

  validates :name, presence: true
  validates :amount, presence: true
end
