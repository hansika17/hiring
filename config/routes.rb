Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  root to: "home#index"
  resources :user
  namespace :account do
    resources :skills, except: [:new, :show]
    resources :jobs, except: [:new, :show]
    resources :roles, except: [:new, :show]
    resources :disciplines, except: [:new, :show]
    resources :people_tags, except: [:new, :show]
    resources :question_categories, except: [:new, :show]
  end
  resources :surveys do
    resources :questions, module: "survey"
    resources :assignees, module: "survey", as: "assignees"
    resources :attempts, module: "survey" do
      get "questions", to: "attempts#survey_questions", as: "survey_questions"
    end
    get "reports/pdf/:id", to: "survey/reports#pdf", as: "report_pdf"
    get "/attempts/:id/preview", to: "survey/attempts#preview", as: "report_preview"
    patch "/reports/:id/submit", to: "survey/reports#submit", as: "report_submit"
    patch "/reports/:id/download", to: "survey/reports#download", as: "report_download"
    get "/search", to: "search#surveys"
  end

  get "/surveys/:id/clone", to: "surveys#clone", as: "clone_survey"

  scope "/settings" do
    get "/profile", to: "user#profile", as: "profile"
    get "/password", to: "user#password", as: "setting_password"
    patch "/password", to: "user#update_password", as: "edit_password"
    get "/preferences", to: "user#preferences", as: "user_preferences"
  end
end
