Rails.application.routes.draw do
  devise_for :users
  namespace :owner do
    resources :agencies, except: [:index] do
      get 'dashboard', to: 'agencies#dashboard'
    end
  end

  resources :agencies, only: [:index, :show] do
    resources :messages, only: [:new, :create]
  end

  # Define the root for the website
  root 'pages#home'

  get 'who_we_are', to: 'pages#who_we_are'
  get 'how_it_works', to: 'pages#how_it_works'
  get 'agencies', to: 'pages#agencies'
  get 'clients', to: 'pages#clients'
  get 'find_agency', to: 'pages#find_agency'

end
