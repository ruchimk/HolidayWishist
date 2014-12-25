Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/sign_up', to: 'devise/registrations#new'
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :items
  resources :users, only: [:show]
  root to: "items#index"
 # root to: "home#index"

  resources :friendships

  get "/searches/", to: "searches#index",  as: 'search_results'



  resources :searches do
    resources :items
  end
end
