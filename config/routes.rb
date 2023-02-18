Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "main#index"

  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :categories_expense, only: [:index]
  end

  resources :expenses, only: [:index, :new, :create, :destroy, :show]
end
