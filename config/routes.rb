Rails.application.routes.draw do
  root to: 'account/flats#index'
  devise_for :users

  resources :flats, only: [:show ] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :flats, only: [:index, :new, :create, :edit, :update]
  end
end
