Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get '/users' => 'users#index' 
  get '/users/new', to: 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit', as: 'user_edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy', as: 'user_destroy'  
  get '/users/:id' => 'users#show', as: 'user'
end
