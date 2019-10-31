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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
