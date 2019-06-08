Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "sessions#root"

  resources :users , except: [:new]

  get "login", to: "users#login"

  post 'login' , to: "sessions#validate"

  get "signup",to: "users#new"

  get "logout", to: "sessions#logout"

  resources :messages , only: [:create]

  mount ActionCable.server, at: "/cable"

end
