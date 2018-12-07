Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get '/profile', to: 'profile#index', as: 'profile'

  resources :posts do 
    resources :comments
  end
end
