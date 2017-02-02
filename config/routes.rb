Rails.application.routes.draw do
  devise_for :users
  resources :migraines
  root 'migraines#index'
end
