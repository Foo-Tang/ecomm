Rails.application.routes.draw do
  root "products#index"
  get "/search", to: "products#search"
  resources :products do
    collection do
      get "new"
      get "updated"
    end
  end
  resources :cart, only: %i[create destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :wrestlers
  resources :producttypes
end
