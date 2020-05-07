Rails.application.routes.draw do
  
  resources :foods
  devise_for :users
  get "/fridges", to: "fridges#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fridges
  root to: 'foods#index'
end
