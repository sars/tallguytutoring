Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  get '/confirm', to: 'users#confirm'
  root 'users#new'
end
