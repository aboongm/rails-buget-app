Rails.application.routes.draw do
  devise_for :users
  get "splashes/index"

  resources :categories
  resources :expenses
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "splashes#index"
end
