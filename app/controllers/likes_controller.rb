class LikesController < ApplicationController
	before_action :authenticate_user, only: [:create]

  def create
    @like = Like.new(gossip_id: params[:gossip_id], author_id: params[:user_id])
    puts params
    if @like.save
<<<<<<< HEAD
      redirect_to user_gossips_path(session[:user_id])
=======
      if params[:url] == "gossip_index"
        redirect_to user_gossips_path(params[:user_id])
      else
        redirect_to user_gossip_path(params[:user_id], params[:gossip_id])
      end
>>>>>>> ac4ead706d8c7040a05ad96a5cf78ec3ec22a0ea
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