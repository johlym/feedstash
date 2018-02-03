Rails.application.routes.draw do
  root "homepage#index"
  resources :homepage, only: :index
  resources :contacts, only: :create
  get 'contact', to: 'contacts#new', as: 'contact'
end