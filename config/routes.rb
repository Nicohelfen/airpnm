Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :flats, only: [:show ] do
    resources :bookings, only: [:new, :create, :index]
    get 'bookings/:booking_id/accept', to: 'bookings#accept', as: :bookings_accept
  end

  namespace :account do
    resources :flats, only: [:index, :new, :create, :edit, :update]
  end
end
