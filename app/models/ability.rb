class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update, :destroy], Category do |category|
      category.author == user
    end

    can [:read, :destroy], Expense do |expense|
      expense.author == user
    end

    can :create, Category
    can :create, Expense
  end
end
