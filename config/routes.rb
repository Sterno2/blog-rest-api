Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
      get "ping", to: 'posts#ping'
      resources :posts, only: [ :index ]
  end
end
