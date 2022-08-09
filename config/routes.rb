Rails.application.routes.draw do
  root "splashes#index"
  devise_for :users

  resources :categories
  resources :expenses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
