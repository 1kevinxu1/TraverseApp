Rails.application.routes.draw do
  root to: 'static_pages#root'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:create]
  namespace :api, defaults: { format: :json } do
    resources :meet_requests, only: [:create, :update]
    resources :users, only: [:index, :show, :update]
    resources :trips, only: [:index, :create, :update, :destroy]
  end
end
