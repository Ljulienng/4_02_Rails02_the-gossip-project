class LikesController < ApplicationController

  def create
    @like = Like.new(gossip_id: params[:gossip_id], author_id: params[:user_id])
    if @like.save
      redirect_to user_gossips_path(params[:user_id])
    else
     redirect_to product_path
    end
  end

end