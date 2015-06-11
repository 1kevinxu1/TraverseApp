Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :profiles, only: [:show, :update]
    resources :trips, only: [:index, :create, :update, :destroy]
  end
end
