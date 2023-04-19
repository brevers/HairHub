Rails.application.routes.draw do
  devise_for :views
  devise_for :agencies
  devise_for :clients

  # Define the root for the website
  root 'pages#home'
  get 'who_we_are', to: 'pages#who_we_are'
  get 'how_it_works', to: 'pages#how_it_works'
  get 'agencies', to: 'pages#agencies'
  get 'clients', to: 'pages#clients'
  get 'find_agency', to: 'pages#find_agency'

  # Define the sign-out route for the Clients model
  devise_scope :client do
    delete '/clients/sign_out', to: 'devise/sessions#destroy'
  end
end
