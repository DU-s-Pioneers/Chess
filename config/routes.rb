Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games
  put '/join/:id', to: 'games#join'
end
