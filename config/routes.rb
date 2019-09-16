Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users, except: :destroy
  resources :subjects
  resources :questions, except: :index
  resources :user_has_subjects, only: %i(create destroy)
  resources :exams, only: %i(create show edit update)
  resources :exam_has_questions, only: %i(create destroy)
  
  namespace :trainee do 
    resources :trainee_answer_sheets, only: %i(index new create show update)
    resources :exams, only: %i(index show)
  end
end
