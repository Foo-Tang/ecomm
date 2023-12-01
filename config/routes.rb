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

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  resources :wrestlers
  resources :producttypes
  resources :abouts
  resources :customers
end
