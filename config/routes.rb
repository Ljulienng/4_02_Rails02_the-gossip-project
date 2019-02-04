Rails.application.routes.draw do

  root 'static#homepage'
  
  get '/sign_up', to: "static#sign_up"
  post '/sign_up', to: "static#sign_up_input"

  get '/log_in', to: "static#log_in"
  post '/log_in', to: "static#log_in_input"

  get '/welcome/:current_user_first_name', to: "dynamic#welcome"
  get '/welcome/:current_user_first_name/:gossip', to: "dynamic#gossip_page"
  get '/welcome/:current_user_first_name/user_page', to: "dynamic#user_page"
  get '/contact', to: "static#contact"
  get "/team", to: "static#team"

end
