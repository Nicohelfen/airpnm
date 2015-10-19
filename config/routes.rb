Rails.application.routes.draw do


  get 'flat/new'

  get 'flat/create'

  get 'flat/update'

  get 'flat/delete'

  get 'flat/show'

  devise_for :users
end
