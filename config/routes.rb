Rails.application.routes.draw do
  resources :bookings, only: :index
  resources :flights do
    resources :bookings
  end
  resources :planes
  resources :seat_configurations do
    collection do
      get :available_rows
      get :available_seats
    end
  end
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
