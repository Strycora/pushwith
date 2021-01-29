Rails.application.routes.draw do

  root(to: "static#welcome")
  resources :workouts
  
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

end
