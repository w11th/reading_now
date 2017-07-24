Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users,
             sign_out_via: [:delete, :get],
             controllers: { sessions: 'users/sessions' }

  resources :books
end
