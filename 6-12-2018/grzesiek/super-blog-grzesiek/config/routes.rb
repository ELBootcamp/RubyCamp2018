Rails.application.routes.draw do
  root 'posts#index'
  get '/user' => 'user#index'

  # get 'posts/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, controller: :posts
end
