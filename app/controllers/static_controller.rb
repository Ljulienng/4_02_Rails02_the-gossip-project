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
    @current_user = User.create!(first_name: params[:first_name])
  end

  def log_in
  end

  def log_in_input
    @current_user = User.where("first_name = ?", params[:first_name])
  end

end
