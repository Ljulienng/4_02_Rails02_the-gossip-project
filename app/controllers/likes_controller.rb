class LikesController < ApplicationController
	before_action :authenticate_user, only: [:create]

  def create
    @like = Like.new(gossip_id: params[:gossip_id], author_id: params[:user_id])
    if @like.save
      redirect_to user_gossips_path(session[:user_id])
    else
     redirect_to product_path
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end