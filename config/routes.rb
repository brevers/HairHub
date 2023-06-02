Rails.application.routes.draw do
  get 'sales/create'
  devise_for :users

  namespace :owner do
    # At the moment, users can't create stores. So no new/create actions.
    resources :agencies, except: [:index, :new, :create] do
      get 'dashboard', to: 'agencies#dashboard'
      resources :plans
    end
  end

  resources :agencies, only: [:index, :show] do
    resources :messages, only: [:new, :create]
    resources :plans do
      resources :sales, only: [:create] do
      end
    end
  end

  resources :messages, only: [:index, :new, :create]

  # Define the root for the website
  root 'pages#home'

  get 'who_we_are', to: 'pages#who_we_are'
  get 'how_it_works', to: 'pages#how_it_works'
  get 'agencies', to: 'pages#agencies'
  get 'clients', to: 'pages#clients'
  get 'find_agency', to: 'pages#find_agency'

end
