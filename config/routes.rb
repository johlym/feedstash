Rails.application.routes.draw do
  root "homepage#index"
  resources :homepage, only: :index
end
