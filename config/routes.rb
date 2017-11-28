Rails.application.routes.draw do
  resources :transactions
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  get 'home/index'

  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :contracts
  
 resources :items do
      resources :ratings, except: [:show, :index]
  end 
  
  resources :rentals do
    put :change_to_accept
    get :acceptance_msg
  end
  resources :items 
  resources :categories
  resources :users
  resources :locations
  resources :user_types
  get "/fetch_items" => 'items#from_category', as: 'fetch_items'
  post "/from_search" => 'items#from_search', as: 'from_search' # search in all items
  get "/all_items" => 'items#all_items', as: 'all_items'
  post "/" => "items#search" , as: "search_items" #search in home page
  get "/unathorized_access" => 'shared#unathorized_access', as: 'unathorized_access'
  get "/terms_and_conditions" => 'shared#terms_and_conditions', as: 'terms_and_conditions'
  
  root 'home#index'
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
