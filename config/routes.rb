Rails.application.routes.draw do
  resources :slack_bots
  resources :messages
  resources :users
  root 'home#index'
  resources :messages, only: :index
  resources :foods 
end
