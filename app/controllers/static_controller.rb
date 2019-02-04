class StaticController < ApplicationController

  def homepage
  end
  
  def team
  end

  def contact
  end

  def gossip_list
  end

  def sign_up
  end

  def sign_up_input
    User.create!(first_name: params[:first_name], email: params[:email])
    redirect_to "/"
  end

  def log_in
  end

  def log_in_input
    @user = User.where("first_name = ? AND email = ?", params[:first_name], params[:email])
    if @user.size == 0 then redirect_to "/try_again" else redirect_to "/welcome/#{params[:first_name]}" end
  end

  def try_again
  end

end
