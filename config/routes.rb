Rails.application.routes.draw do
  devise_for :users
  get "splashes/index"

  resources :categories
  resources :expenses
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  unauthenticated do
    root "splashes#index"
  end

  authenticated do
    root "categories#index", as: :authenticated_root
  end
end
