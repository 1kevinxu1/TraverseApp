Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:create]
  resource :session, only: [:new, :create, :destroy]
  resource :profile, only: [:new]

  namespace :api, defaults: { format: :json } do
    resource :profile, only: [:create, :show, :update]
  end
end
