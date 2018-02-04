Rails.application.routes.draw do
  # The homepage
  root "homepage#index"

  # Contact Form
  resources :contacts, only: :create, :path => 'contact'
  get 'contact', to: 'contacts#new', as: 'contact'

  # Devise
  devise_for :users, :path => "user", skip: [:sessions]

  # Overrides
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # Error Handling
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end