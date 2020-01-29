Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
      resources :posts, only: [ :index ]
      # get "posts?tag=#{:tag}&sortBy=#{:attribute}&direction=#{:direction}", to: 'posts#tag'
      get "posts/all", to: 'posts#all'
  end
end
