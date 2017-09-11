Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/:page", to: "static_pages#show"
end
