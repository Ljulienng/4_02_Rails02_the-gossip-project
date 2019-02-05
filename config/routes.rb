Rails.application.routes.draw do

  root 'static#homepage'
  get '/contact', to: "static#contact"
  get '/team', to: "static#team"

  resources :users, only: [:new, :create] do
    resources :gossips do
      resources :authors, only: [:show]
    end
  end
  
end
