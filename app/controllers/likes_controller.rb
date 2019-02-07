class LikesController < ApplicationController

  def create
    @like = Like.new(gossip_id: params[:gossip_id], author_id: params[:user_id])
    puts params
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

end