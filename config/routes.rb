Rails.application.routes.draw do

  get '/sign_up', to: "static#sign_up"
  get '/log_in', to: "static#log_in"
  get '/welcome/:first_name', to: "dynamic#welcome"
  get '/gossip_list/:gossip', to: "dynamic#gossip_page"
  get '/welcome/:first_name/user_page', to: "dynamic#user_page"
  get '/contact', to: "static#contact"
  get "/team", to: "static#team"

end
