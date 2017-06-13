Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
  resources :products
  resources :sub_categories
  resources :reviews
  resources :cart_line_items

  root "products#index"
end
