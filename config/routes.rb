Rails.application.routes.draw do
  # Define the root for the website
  root 'pages#home'

  get 'WhoWeAre' => 'pages#WhoWeAre'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  # root "articles#index"
end
