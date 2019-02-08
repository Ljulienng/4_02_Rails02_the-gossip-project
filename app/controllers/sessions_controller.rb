class SessionsController < ApplicationController

	def create
	  # cherche s'il existe un utilisateur en base avec l’e-mail
	  puts "*" * 60
	  puts params[:email]
	  puts "*" * 60
	  user = User.find_by(email: params[:email])

	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if user && user.authenticate(params[:password])
	    log_in user
	    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
	    remember user
	    redirect_to user_gossips_path(session[:user_id])
	    # redirige où tu veux, avec un flash ou pas

	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	def destroy
  	log_out if logged_in
  	redirect_to "/"
	end

end
