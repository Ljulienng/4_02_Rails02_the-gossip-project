Rails.application.routes.draw do

  get '/sign_up', to: "static#sign_up"
  post '/sign_up', to: "static#sign_up_input"

  get '/log_in', to: "static#log_in"
  post '/log_in', to: "static#log_in_input"

  get '/welcome/:current_user.name', to: "dynamic#welcome"
  get '/gossip_list/:gossip', to: "dynamic#gossip_page"
  get '/welcome/:first_name/user_page', to: "dynamic#user_page"
  get '/contact', to: "static#contact"
  get "/team", to: "static#team"

end
