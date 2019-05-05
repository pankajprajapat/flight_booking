Rails.application.routes.draw do
  resources :flights
  resources :planes
  resources :seat_configurations
  resources :categories
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :dashboard, only: :index 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
