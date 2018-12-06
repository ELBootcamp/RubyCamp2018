Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get '/profile', to: 'profiles#index'

  resources :users do 
    resources :posts
  end
end
