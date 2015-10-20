Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :flats, only: [:index, :new, :create]
  end
end
