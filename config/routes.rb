Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    collection do
      get 'new'
      get 'updated'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :wrestlers
  resources :producttypes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
