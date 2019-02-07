class AuthorsController < ApplicationController
  
  def show
    @author = Gossip.find(params[:gossip_id]).author
  end

private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  
end