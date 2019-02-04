Rails.application.routes.draw do

  root 'static#homepage'

  
  get '/sign_up', to: "static#sign_up"
  post '/sign_up', to: "static#sign_up_input"

  get '/log_in', to: "static#log_in"
  post '/log_in', to: "static#log_in_input"

  get '/welcome/:first_name', to: "dynamic#welcome"
  get '/gossip_page/:id/author', to: "dynamic#author_page", as: "author"
  get '/contact', to: "static#contact"
  get "/team", to: "static#team"
  get "/gossip_page/:id", to: "dynamic#gossip_page", as: "gossip"

end
