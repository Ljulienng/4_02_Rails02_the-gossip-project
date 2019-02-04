Rails.application.routes.draw do

  get '/welcome/:first_name', to: "dynamic#welcome"
  get '/gossip_list/:gossip', to: "dynamic#gossip_page"
  get '/welcome/:first_name/user_page', to: "dynamic#user_page"
  get '/contact', to: "static#contact"
  get "/team", to: "static#team"

end
