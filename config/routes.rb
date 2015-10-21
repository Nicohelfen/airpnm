Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, expect: [:sessions]

  resources :flats, only: [:show ] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    root to: "profile#edit"
    resources :flats, only: [:index, :new, :create, :edit, :update]
    resource :profile, only: [:edit], controller: "profile"
    resources :bookings, only: [:index]  do
      member do
        put :accept
      end
    end

  end
end

