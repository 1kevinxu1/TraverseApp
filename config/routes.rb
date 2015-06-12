Rails.application.routes.draw do
  root to: 'static_pages#root'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:create]
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index]
    resources :profiles, only: [:show, :update]
    resources :trips, only: [:index, :create, :update, :destroy]
  end
end
