Rails.application.routes.draw do
  # mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/sign_up', to: 'devise/registrations#new'
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  # get '/api_call', to: 'items#make_api_call'

  resources :items
  resources :users, only: [:show]
  root to: "items#index"
  # root to: "home#index"

  # post '/', to: 'items#create'
  resources :friendships
end
