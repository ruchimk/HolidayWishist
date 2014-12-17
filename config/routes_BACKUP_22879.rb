Rails.application.routes.draw do
<<<<<<< HEAD
  # mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
=======
>>>>>>> etsy_gem
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/sign_up', to: 'devise/registrations#new'
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

<<<<<<< HEAD
  # get '/api_call', to: 'items#make_api_call'

=======
>>>>>>> etsy_gem
  resources :items
  resources :users, only: [:show]
  root to: "items#index"
  # root to: "home#index"

  # post '/', to: 'items#create'
  resources :friendships
<<<<<<< HEAD
=======


  get "/searches/", to: "searches#index",  as: 'search_results'



  resources :searches do
    resources :items # makes routes like 'wishlists/1/items', which should have a page with all the items for the wishlist with id 1
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
>>>>>>> etsy_gem
end
