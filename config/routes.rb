Rails.application.routes.draw do
  devise_for :users, :path => 'session'
  # The homepage
  root "homepage#index"

  # Contact Form
  resources :contacts, only: :create, :path => 'contact'
  get 'contact', to: 'contacts#new', as: 'contact'

  # Profile page
  resource :user, :path => 'profile', as: 'profile', only: [:show, :update]

  # Error Handling
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end