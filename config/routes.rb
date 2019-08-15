Rails.application.routes.draw do
  root "session#new"

  get "supervisor/index"
  get "trainee/index"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users  
end
