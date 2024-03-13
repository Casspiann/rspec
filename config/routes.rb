Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Remove or comment out Active Admin routes
  # devise_for :admin_users, ActiveAdmin::Devise.config

  resources :comments
  root to: 'api/v1/employees#index'
  
  namespace :api do
    namespace :v1 do
      resources :employees
      resources :sessions, only: [:create] # Limiting routes for sessions to 'create'
      resources :users, only: [:create, :destroy]
      delete 'logout', to: 'sessions#destroy' # Route for logout
    end
  end
end
