Rails.application.routes.draw do


  root 'static#homepage'
  get '/contact', to: "static#contact"
  get '/team', to: "static#team"
  post '/button', to: "gossips#like"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:index, :show]
  resources :users, only: [:new, :create, :show] do
    resources :gossips do
      resources :likes, only: [:create, :destroy]
      resources :authors, only: [:show]
      resources :comments do
        resources :undercomment
      end
    end
  end
  
end
