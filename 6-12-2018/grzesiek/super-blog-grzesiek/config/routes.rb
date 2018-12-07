Rails.application.routes.draw do
  root 'user#profile'
  get '/user' => 'user#profile'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, controller: :posts
end
