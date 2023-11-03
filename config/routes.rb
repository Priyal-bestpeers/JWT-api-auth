Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/secret', to: 'secrets#secret_action'
end
