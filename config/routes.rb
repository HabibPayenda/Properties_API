Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'properties', to: 'properties#index'
      get 'properties/:id', to: 'properties#show'
      post 'properties', to: 'properties#create'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
