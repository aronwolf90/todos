Rails.application.routes.draw do
  get :impresum, to: "impresum#index"
  get :privacy, to: "privacy#index"
  get :terms, to: "terms#index"

  resource :registration
  resource :session
  resources :passwords, param: :token

  resources :lists do
    resources :items, only: %i[new create]
  end

  resources :items, only: %i[edit update destroy] do
    scope module: "items" do
      resource :check, only: :update
    end
  end

  resource :profile, only: %i[show destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "welcome#index"
end
