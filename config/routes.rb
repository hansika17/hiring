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
    resources :people_tags, except: [:new, :show]
    resources :project_tags, except: [:new, :show]
    resources :tags, except: [:new, :show]
  end

  scope "/settings" do
    get "/profile", to: "user#profile", as: "profile"
    get "/password", to: "user#password", as: "setting_password"
    patch "/password", to: "user#update_password", as: "edit_password"
    get "/preferences", to: "user#preferences", as: "user_preferences"
  end
end
