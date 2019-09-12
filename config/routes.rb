Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users, except: :destroy
  resources :subjects
  
  namespace :trainee do 
    resources :trainee_answer_sheets, only: %i(index new create show)
    resources :exams, only: %i(index show)
  end
end
