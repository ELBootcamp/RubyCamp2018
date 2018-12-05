Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/users' => 'users#index' # defaultowo to oznacza 'as: user_path'
  post '/users' => 'users#create'
  get '/users/new' => 'users#new', as: 'new_user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show', as: 'user'
  delete '/users/:id' => 'users#destroy'
end
