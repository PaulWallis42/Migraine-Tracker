Rails.application.routes.draw do
  devise_for :users
  resources :migraines
  resources :foods
  root 'migraines#index'
end
