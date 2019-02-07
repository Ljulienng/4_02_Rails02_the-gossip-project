Rails.application.routes.draw do


  root 'static#homepage'
  get '/contact', to: "static#contact"
  get '/team', to: "static#team"

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
