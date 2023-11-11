Rails.application.routes.draw do
  get 'producttypes/index'
  get 'producttypes/show'
  get 'products/index'
  get 'products/show'
  get 'wrestlers/index'
  get 'wrestlers/show'
  get 'wrestler/index'
  get 'wrestler/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
