# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'properties', to: 'properties#index'
      get 'properties/:id', to: 'properties#show'
      post 'properties', to: 'properties#create'
      patch 'properties/:id', to: 'properties#update'
      delete 'properties/:id', to: 'properties#delete'

      get 'users', to: 'users#index'
      get 'users/:id', to: 'users#show'
      post 'users', to: 'users#create'
      patch 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#delete'

      get 'property_managers', to: 'property_managers#index'
      get 'property_managers/:id', to: 'property_managers#show'
      post 'property_managers', to: 'property_managers#create'
      patch 'property_managers/:id', to: 'property_managers#updata'
      delete 'property_managers/:id', to: 'property_managers#delete'

      get 'contacts', to: 'contacts#index'
      get 'contact/:id', to: 'contacts#show'
      post 'contacts', to: 'contacts#create'
      patch 'contacts/:id', to: 'contacts#update'
      delete 'contacts/:id', to: 'contacts#delete'

      get 'property_managers_contacts', to: 'property_managers_contacts#index'
      get 'property_managers_contacts/:id', to: 'property_managers_contacts#show'
      post 'property_managers_contacts', to: 'property_managers_contacts#create'
      patch 'property_managers_contacts/:id', to: 'property_managers_contacts#update'
      delete 'property_managers_contacts/:id', to: 'property_managers_contacts#delete'

      get 'user_contacts', to: 'user_contacts#index'
      get 'user_contacts/:id', to: 'user_contacts#show'
      post 'user_contacts', to: 'user_contacts#create'
      patch 'user_contacts/:id', to: 'user_contacts#update'
      get 'user_contacts/:id', to: 'user_contacts#delete'

      get 'agent_contacts', to: 'agent_contacts#index'
      get 'agent_contacts/:id', to: 'agent_contacts#show'
      post 'agent_contacts', to: 'agent_contacts#create'
      patch 'agent_contacts/:id', to: 'agent_contacts#update'
      delete 'agent_contacts/:id', to: 'agent_contacts#delete'

      get 'agent_contacts', to: 'agent_contacts#index'
      get 'agent_contacts/:id', to: 'agent_contacts#show'
      post 'agent_contacts', to: 'agent_contacts#create'
      patch 'agent_contacts/:id', to: 'agent_contacts#update'
      delete 'agent_contacts/:id', to: 'agent_contacts#delete'

      get 'homes', to: 'homes#index'
      get 'homes/:id', to: 'homes#show'
      post 'homes', to: 'homes#create'
      patch 'homes/:id', to: 'homes#update'
      delete 'homes/:id', to: 'homes#delete'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
