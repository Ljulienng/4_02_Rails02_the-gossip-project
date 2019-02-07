Rails.application.routes.draw do


  root 'static#homepage'
  get '/contact', to: "static#contact"
  get '/team', to: "static#team"
  post '/:user_id/button', to: "gossips#like", as: "button"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:index, :show]
  resources :users, only: [:new, :create] do
    resources :gossips do
      resources :authors, only: [:show]
      resources :comments do
        resources :undercomment
      end
    end
  end
  
end
