require "sidekiq/web"
Sidekiq::Web.set :sessions, false

Rails.application.routes.draw do
  resources :posts
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'
end
