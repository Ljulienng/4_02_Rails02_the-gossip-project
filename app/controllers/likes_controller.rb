class LikesController < ApplicationController

  def create
    @like = Like.new(gossip_id: params[:gossip_id], author_id: params[:user_id])
    if @like.save
      if params[:url] == "gossip_index"
        redirect_to user_gossips_path(params[:user_id])
      else
        redirect_to user_gossip_path(params[:user_id], params[:gossip_id])
      end
    else
    redirect_to product_path
    end
  end
  

  def destroy
    Like.find(Like.where("gossip_id = ? AND author_id = ?", params[:gossip_id], params[:user_id]).id).destroy
    redirect_to user_gossip_path(params[:user_id], params[:gossip_id])
  end

end