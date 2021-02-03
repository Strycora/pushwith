Rails.application.routes.draw do

  
  root to: "sessions#welcome"

  resources :workout_groups do 
    resources :workouts
  end


  resources :user_groups#, only: [:new, :create]
  
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via:[:get, :post]

end
