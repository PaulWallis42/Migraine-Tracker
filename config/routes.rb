Rails.application.routes.draw do
  resources :migraines
  root 'migraines#index'
end
