Rails.application.routes.draw do

  root 'static#homepage'

  # get '/sign_up', to: "static#sign_up"
  # post '/sign_up', to: "static#sign_up_input"

  # get '/log_in', to: "static#log_in"
  # post '/log_in', to: "static#log_in_input"
  # get '/try_again', to: "static#try_again"

  # get '/welcome/:first_name', to: "dynamic#welcome"
  # get '/:first_name/gossip_page/:id/author', to: "dynamic#author_page"

  get '/contact', to: "static#contact"
  get '/team', to: "static#team"
  # get "/:first_name/gossip_page/:id", to: "dynamic#gossip_page"

  resources :users, only: [:new, :create] do
    resources :gossips do
      resources :authors, only: [:show]
    end
  end
  
end
