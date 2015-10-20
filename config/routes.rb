Rails.application.routes.draw do
  root to: 'account/flats#index'
  devise_for :users

  resources :flats, only: [:index, :show ] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :flats, only: [:index, :new, :create, :edit, :update]
  end
end


#               Prefix Verb   URI Pattern                            Controller#Action
#                     root GET    /                                      account/flats#index
#         new_user_session GET    /users/sign_in(.:format)               devise/sessions#new
#             user_session POST   /users/sign_in(.:format)               devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)              devise/sessions#destroy
#            user_password POST   /users/password(.:format)              devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)         devise/passwords#edit
#                          PATCH  /users/password(.:format)              devise/passwords#update
#                          PUT    /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                devise/registrations#cancel
#        user_registration POST   /users(.:format)                       devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)               devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                  devise/registrations#edit
#                          PATCH  /users(.:format)                       devise/registrations#update
#                          PUT    /users(.:format)                       devise/registrations#update
#                          DELETE /users(.:format)                       devise/registrations#destroy
#            flat_bookings POST   /flats/:flat_id/bookings(.:format)     bookings#create
#         new_flat_booking GET    /flats/:flat_id/bookings/new(.:format) bookings#new
#                    flats GET    /flats(.:format)                       flats#index
#                     flat GET    /flats/:id(.:format)                   flats#show
#            account_flats GET    /account/flats(.:format)               account/flats#index
#                          POST   /account/flats(.:format)               account/flats#create
#         new_account_flat GET    /account/flats/new(.:format)           account/flats#new
