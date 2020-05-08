Rails.application.routes.draw do
  
  resources :foods
  devise_for :users
  resources :fridges do
    resources :locations
    resources :foods
  end
  root to: 'foods#index'
end
