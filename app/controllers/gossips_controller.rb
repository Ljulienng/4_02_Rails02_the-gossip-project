class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], author: User.find(params[:user_id]))

    if @gossip.save
      redirect_to user_gossips_path(params[:user_id])
    else
      render "new"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(new_gossip)
      redirect_to user_gossip_path(params[:user_id],@gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to user_gossips_path(params[:user_id]), notice: "The Gossip #{@gossip.title} has been deleted correctly."
  end

  def like
    Like.new(gossip: @current_gossip_id, author: params[:user_id])
    redirect_to user_gossips_path(params[:user_id])
  end

  private

  def new_gossip
    params.require(:gossip).permit(:title, :content)
  end

end