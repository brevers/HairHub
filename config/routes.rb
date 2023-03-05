Rails.application.routes.draw do
  devise_for :views
  devise_for :agencies
  devise_for :clients
  # Define the root for the website
  root 'pages#home'
  get 'WhoWeAre', to: 'pages#WhoWeAre'

  # Define the sign-out route for the Clients model
  devise_scope :client do
    delete '/clients/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  # root "articles#index"
end
