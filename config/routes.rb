Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :flats, only: [:show ] do
    resources :bookings, only: [:new, :create]

  end

  namespace :account do
    resources :flats, only: [:index, :new, :create, :edit, :update]
    resources :bookings, only: [:index]  do
      member do
        put :accept
      end
    end

  end
end

