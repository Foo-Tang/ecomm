Rails.application.routes.draw do
  root "products#index"
  get "/search", to: "products#search"
  resources :products do
    collection do
      get "new"
      get "updated"
    end
  end
  resources :checkout, only: %i[create]
  post "checkout/create", to: "checkout#create"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :wrestlers
  resources :producttypes
end
