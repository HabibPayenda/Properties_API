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

      get 'home_rooms', to: 'home_rooms#index'
      get 'home_rooms/:id', to: 'home_rooms#show'
      post 'home_rooms', to: 'home_rooms#create'
      patch 'home_rooms/:id', to: 'home_rooms#update'
      delete 'home_rooms/:id', to: 'home_rooms#delete'

      get 'lands', to: 'lands#index'
      get 'lands/:id', to: 'lands#show'
      post 'lands', to: 'lands#create'
      patch 'lands/:id', to: 'lands#update'
      delete 'lands/:id', to: 'lands#delete'

      get 'cars', to: 'cars#index'
      get 'cars/:id', to: 'cars#show'
      post 'cars', to: 'cars#create'
      patch 'cars/:id', to: 'cars#update'
      delete 'cars/:id', to: 'cars#delete'

      get 'admins', to: 'admins#index'
      get 'admins/:id', to: 'admins#show'
      post 'admins', to: 'admins#create'
      patch 'admins/:id', to: 'admins#update'
      delete 'admins/:id', to: 'admins#delete'

      get 'addresses', to: 'addresses#index'
      get 'addresses/:id', to: 'addresses#show'
      post 'addresses', to: 'addresses#create'
      patch 'addresses/:id', to: 'addresses#update'
      delete 'addresses/:id', to: 'addresses#delete'

      get 'user_address', to: 'user_addresses#index'
      get 'user_address/:id', to: 'user_addresses#show'
      post 'user_address', to: 'user_addresses#create'
      patch 'user_address/:id', to: 'user_addresses#update'
      delete 'user_address/:id', to: 'user_addresses#delete'

      get 'agent_addresses', to: 'agent_addresses#index'
      get 'agent_addresses/:id', to: 'agent_addresses#show'
      post 'agent_addresses', to: 'agent_addresses#create'
      patch 'agent_addresses/:id', to: 'agent_addresses#update'
      delete 'agent_addresses/:id', to: 'agent_addresses#delete'

      get 'admin_addresses', to: 'admin_addresses#index'
      get 'admin_addresses/:id', to: 'admin_addresses#show'
      post 'admin_addresses', to: 'admin_addresses#create'
      patch 'admin_addresses/:id', to: 'admin_addresses#update'
      delete 'admin_addresses/:id', to: 'admin_addresses#delete'

      get 'property_manger_addresses', to: 'property_manger_addresses#index'
      get 'property_manger_addresses/:id', to: 'property_manger_addresses#show'
      post 'property_manger_addresses', to: 'property_manger_addresses#create'
      patch 'property_manger_addresses/:id', to: 'property_manger_addresses#update'
      delete 'property_manger_addresses/:id', to: 'property_manger_addresses#delete'

      get 'property_addresses', to: 'property_addresses#index'
      get 'property_addresses/:id', to: 'property_addresses#show'
      post 'property_addresses', to: 'property_addresses#create'
      patch 'property_addresses/:id', to: 'property_addresses#update'
      delete 'property_addresses/:id', to: 'property_addresses#delete'

      get 'appointment_addresses', to: 'appointment_addresses#index'
      get 'appointment_addresses/:id', to: 'appointment_addresses#show'
      post 'appointment_addresses', to: 'appointment_addresses#create'
      patch 'appointment_addresses/:id', to: 'appointment_addresses#update'
      delete 'appointment_addresses/:id', to: 'appointment_addresses#delete'

      get 'amenities', to: 'amenities#index'
      get 'amenities/:id', to: 'amenities#show'
      post 'amenities', to: 'amenities#create'
      patch 'amenities/:id', to: 'amenities#update'
      delete 'amenities/:id', to: 'amenities#delete'

      get 'restrictions', to: 'restrictions#index'
      get 'restrictions/:id', to: 'restrictions#show'
      post 'restrictions', to: 'restrictions#create'
      patch 'restrictions/:id', to: 'restrictions#create'
      delete 'restrictions/:id', to: 'restrictions#delete'

      get 'agents', to: 'agents#index'
      get 'agents/:id', to: 'agents#show'
      post 'agents', to: 'agents#create'
      patch 'agents/:id', to: 'agents#update'
      delete 'agents/:id', to: 'agents#delete'

      get 'deals', to: 'deals#index'
      get 'deals/:id', to: 'deals#show'
      post 'deals', to: 'deals#create'
      patch 'deals/:id', to: 'deals#update'
      delete 'deals/:id', to: 'deals#delete'

      get 'reports', to: 'reports#index'
      get 'reports/:id', to: 'reports#show'
      post 'reports', to: 'reports#create'
      patch 'reports/:id', to: 'reports#update'
      delete 'reports/:id', to: 'reports#delete'

      get 'offers', to: 'offers#index'
      get 'offers/:id', to: 'offers#show'
      post 'offers', to: 'offers#create'
      patch 'offers/:id', to: 'offers#update'
      delete 'offers/:id', to: 'offers#delete'

      get 'appointments', to: 'appointments#index'
      get 'appointments/:id', to: 'appointments#show'
      post 'appointments', to: 'appointments#create'
      patch 'appointments/:id', to: 'appointments#update'
      delete 'appointments/:id', to: 'appointments#delete'

      get 'property_reports', to: 'property_reports#index'
      get 'property_reports/:id', to: 'property_reports#show'
      post 'property_reports', to: 'property_reports#create'
      patch 'property_reports/:id', to: 'property_reports#update'
      delete 'property_reports/:id', to: 'property_reports#delete'

      get 'user_favorites', to: 'user_favorites#index'
      get 'user_favorites/:id', to: 'user_favorites#show'
      post 'user_favorites', to: 'user_favorites#index'
      patch 'user_favorites/:id', to: 'user_favorites#update'
      delete 'user_favorites/:id', to: 'user_favorites#delete'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
