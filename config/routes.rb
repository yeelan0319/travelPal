TravelPal::Application.routes.draw do
    namespace :api, defaults: {format: :json} do
        resources :trips, only: [:index, :create, :show, :update, :destroy, :options] do
          resources :users, only: [:update, :destroy], :controller => 'trip_owner'
          resources :chats, only: [:index, :create]
        end
        resources :users, only: [:create, :options] do
          resources :trips, only: [:index, :update, :destroy], :controller => 'trip_participant'
        end
        resources :sessions, only: [:create, :destroy, :options]
        match '/trips/search', to: 'trips#search', via: 'post'
        match '/signup', to: 'users#index', via: [:options]
        match '/signin', to: 'sessions#index', via: [:options]
        match '/signout', to: 'sessions#index', via: [:options]
        match '/trips', to: 'trips#index', via: [:options]
        match '/trips/:id', to: 'trips#index', via: [:options]
        match '/trips/:trip_id/users/:id', to: 'trips#index', via: [:options]
        match '/trips/:trip_id/chats', to: 'trips#index', via: [:options]
        match '/trips/search', to: 'trips#index', via: [:options]
        match '/users/:user_id/trips', to: 'trips#index', via: [:options]
        match '/users/:user_id/trips/:id', to: 'trips#index', via: [:options]
        match '/signup', to:'users#create', via:'post'
        match '/signin', to:'sessions#create', via:'post'
        match '/signout', to:'sessions#destroy', via:'delete'
    end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
