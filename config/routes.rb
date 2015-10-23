Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :flats, only: [:show, :index ] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    root to: "profile#index"
    resources :flats, only: [:index, :new, :create, :edit, :update]
    resource :profile, only: [:show, :update, :edit], controller: "profile"
    resources :bookings, only: [:index]  do
      member do
        put :accept
      end
    end

  end
end

