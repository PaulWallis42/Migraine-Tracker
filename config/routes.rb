Rails.application.routes.draw do
  get 'home/index'
  get 'home/resources'
  get 'home/about'

  devise_for :users
  resources :migraines
  resources :foods
  root 'home#index'
end
