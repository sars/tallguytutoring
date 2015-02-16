Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users, only: [:show, :create]
  get '/confirm', to: 'users#confirm'
  root 'users#new'
end
