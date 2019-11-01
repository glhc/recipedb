Rails.application.routes.draw do
  get 'search/results' => 'search#results'
  get root :to => 'pages#home'
  get '/about' => 'pages#about'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  delete '/login' => 'sessions#destroy'
  post '/' => 'search#search'
  get '/results' => 'pages#results'
  
  
  get '/signup' => 'pages#sign_up'
  get '/signup/failure' => 'pages#signup_failure'
  get '/signup/success' => 'pages#signup_success'
  
  get '/create/' => 'pages#recipe_form'
  post '/create/' => 'pages#recipe_create'
  get '/create/ingredients' => 'pages#recipe_ingredients'
  post '/create/ingredients' => 'pages#create_ingredients'
  get '/create/instructions' => 'pages#recipe_instructions'
  post'/create/instructions' => 'pages#create_instructions'
  get '/create/success' => 'pages#recipe_success'
  get '/create/failure' => 'pages#recipe_failure' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
