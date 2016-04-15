Rails.application.routes.draw do
  resources :users
  root 'home#index'
  resources :messages, only: :index
  resources :foods 
end
