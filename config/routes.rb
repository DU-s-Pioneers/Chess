Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games
  resources :pieces
  put '/join/:id', to: 'games#join'
end
