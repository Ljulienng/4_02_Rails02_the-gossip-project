class SessionsController < ApplicationController

	def create
	  # cherche s'il existe un utilisateur en base avec l’e-mail
	  puts "*" * 60
	  puts params[:email]
	  puts "*" * 60
	  user = User.find_by(email: params[:email])

	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to team_path
	    # redirige où tu veux, avec un flash ou pas

	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	def destroy
  	session.delete(:user_id)
	end

end
