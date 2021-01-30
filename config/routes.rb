Rails.application.routes.draw do

  resources :workout_groups
  root(to: "static#welcome")
  resources :workouts
  
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "destroy_user_session"

  match '/auth/:google_oauth2/callback' => 'sessions#google', via:[:get, :post]

end
