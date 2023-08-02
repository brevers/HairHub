# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: "devise/extended_registrations"
             }

  devise_scope :user do
    get 'new_owner_registration', to: "devise/extended_registrations#owner"
  end

  post "stripe/webhook", to: "stripe#webhook"

  namespace :owner do
    get 'dashboard', to: 'agencies#dashboard'

    resource :claim, only: [:create] do
    end

    resources :agencies, except: %i[index new create] do
    end
  end

  resources :subscriptions, only: [:new] do
  end

  resources :agencies, only: %i[index show update] do
    resources :plans
    resources :messages, only: %i[new create]
  end

  resources :messages, only: %i[index new create]

  # Define the root for the website
  root 'pages#home'

  get 'who_we_are', to: 'pages#who_we_are'
  get 'how_it_works', to: 'pages#how_it_works'
  get 'agencies', to: 'pages#agencies'
  get 'clients', to: 'pages#clients'
  get 'find_agency', to: 'pages#find_agency'
end
