Rails.application.routes.draw do
  
  resources :foods
  devise_for :users
  get "/fridges", to: "fridges#index"
  resources :fridges do
    resources :locations
    resources :foods
  end
  root to: 'foods#index'
end
