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
      post '/users/posh_token/:id', to: 'users#add_push_token'
      post 'users', to: 'users#create'
      patch 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#delete'
      get 'users/recent/users', to: 'users#recent_users'
      post 'users/login', to: 'users#login'
      post 'user_profile_image/:id', to: 'users#upload_profile_image'
      post 'user_last_login/:id', to: 'users#last_login'

      post 'user_notify/:id', to: 'users#notify'

      post 'user_home_views', to: 'user_home_views#create'

      post 'user_car_views', to: 'user_car_views#create'

      get 'property_managers', to: 'property_managers#index'
      get 'property_managers/:id', to: 'property_managers#show'
      post 'property_managers', to: 'property_managers#create'
      patch 'property_managers/:id', to: 'property_managers#updata'
      delete 'property_managers/:id', to: 'property_managers#delete'
      get 'property_managers/properties/:id', to: 'property_managers#get_properties'

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
      get '/homes/search', to: 'homes#search'
      get 'homes/:id', to: 'homes#show'
      post 'homes', to: 'homes#create'
      patch 'homes/:id', to: 'homes#update'
      delete 'homes/:id', to: 'homes#delete'
      post 'homes/room', to: 'homes#create_room'
      patch 'homes/room/:id', to: 'homes#update_room'
      delete 'homes/room/:id', to: 'homes#delete_room'
      post 'homes/amenity', to: 'homes#create_amenity'
      post 'homes/restriction', to: 'homes#creat_restriction'
      post 'homes/add_offer/:id', to: 'homes#create_offer'


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
      post 'admins/login', to: 'admins#login'
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
      get 'agents/properties/:id', to: 'agents#get_properties'

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
      post 'user_favorites', to: 'user_favorites#create'
      patch 'user_favorites/:id', to: 'user_favorites#update'
      delete 'user_favorites/:id', to: 'user_favorites#delete'

      get 'user_searches', to: 'user_searches#index'
      get 'user_searches/:id', to: 'user_searches#show'
      post 'user_searches', to: 'user_searches#create'
      patch 'user_searches/:id', to: 'user_searches#update'
      delete 'user_searches/:id', to: 'user_searches#delete'

      post 'user_favorite_homes', to: 'user_favorite_homes#create'
      delete 'user_favorite_homes/:id', to: 'user_favorite_homes#destroy'

      get 'user_views', to: 'user_views#index'
      get 'user_views/:id', to: 'user_views#show'
      post 'user_views', to: 'user_views#create'
      patch 'user_views/:id', to: 'user_views#update'
      delete 'user_views/:id', to: 'user_views#delete'

      get 'reviews', to: 'reviews#index'
      get 'reviews/:id', to: 'reviews#show'
      post 'reviews', to: 'reviews#create'
      patch 'reviews/:id', to: 'reviews#update'
      delete 'reviews/:id', to: 'reviews#delete'

      get 'user_reviews', to: 'user_reviews#index'
      get 'user_reviews/:id', to: 'user_reviews#show'
      post 'user_reviews', to: 'user_reviews#create'
      patch 'user_reviews/:id', to: 'user_reviews#update'
      delete 'user_reviews/:id', to: 'user_reviews#delete'

      get 'agent_reviews', to: 'agent_reviews#index'
      get 'agent_reviews/:id', to: 'agent_reviews#show'
      post 'agent_reviews', to: 'agent_reviews#create'
      patch 'agent_reviews/:id', to: 'agent_reviews#update'
      delete 'agent_reviews/:id', to: 'agent_reviews#delete'

      get 'property_manager_reviews', to: 'property_manager_reviews#index'
      get 'property_manager_reviews/:id', to: 'property_manager_reviews#show'
      post 'property_manager_reviews', to: 'property_manager_reviews#create'
      patch 'property_manager_reviews/:id', to: 'property_manager_reviews#update'
      delete 'property_manager_reviews/:id', to: 'property_manager_reviews#delete'

      get 'trainer_reviews', to: 'trainer_reviews#index'
      get 'trainer_reviews/:id', to: 'trainer_reviews#show'
      post 'trainer_reviews', to: 'trainer_reviews#create'
      patch 'trainer_reviews/:id', to: 'trainer_reviews#update'
      delete 'trainer_reviews/:id', to: 'trainer_reviews#delete'

      get 'trainings', to: 'trainings#index'
      get 'trainings/:id', to: 'trainings#show'
      post 'trainings', to: 'trainings#create'
      patch 'trainings/:id', to: 'trainings#update'
      delete 'trainings/:id', to: 'trainings#delete'

      get 'training_records', to: 'training_records#index'
      get 'training_records/:id', to: 'training_records#show'
      post 'training_records', to: 'training_records#create'
      patch 'training_records/:id', to: 'training_records#update'
      delete 'training_records/:id', to: 'training_records#delete'

      get 'trainers', to: 'trainers#index'
      get 'trainers/:id', to: 'trainers#show'
      post 'trainers', to: 'trainers#create'
      patch 'trainers/:id', to: 'trainers#update'
      delete 'trainers/:id', to: 'trainers#delete'

      get 'suggestions', to: 'suggestions#index'
      get 'suggestions/:id', to: 'suggestions#show'
      post 'suggestions', to: 'suggestions#create'
      patch 'suggestions/:id', to: 'suggestions#update'
      delete 'suggestions/:id', to: 'suggestions#delete'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
