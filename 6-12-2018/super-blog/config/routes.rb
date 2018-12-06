Rails.application.routes.draw do
  devise_for :users

  resources :blog_posts, controller: :posts
end
