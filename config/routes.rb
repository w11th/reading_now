Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users,
             sign_out_via: [:delete, :get]

  resources :books
end
