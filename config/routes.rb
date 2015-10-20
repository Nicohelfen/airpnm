Rails.application.routes.draw do
  devise_for :users

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :flats, only: [:index, :new, :create]
  end
end
