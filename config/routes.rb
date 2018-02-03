Rails.application.routes.draw do
  devise_for :users
  # The homepage
  root "homepage#index"

  # Contact Form
  resources :contacts, only: :create
  get 'contact', to: 'contacts#new', as: 'contact'

  # Error Handling
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end