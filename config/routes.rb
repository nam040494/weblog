Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "static_pages/:page", to: "static_pages#show"

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users, only: %i(index show)
  resources :posts
end
