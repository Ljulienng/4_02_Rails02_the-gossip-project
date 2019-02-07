class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(author: User.find(params[:user_id]), gossip: Gossip.find(params[:gossip_id]))
    @comment.content = comment_params.values[0]
    if @comment.save
      redirect_to user_gossip_comments_path(params[:user_id], params[:gossip_id])
    else
      render "new"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_gossip_comment_path(params[:user_id], params[:gossip_id], params[:id])
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_gossip_comments_path(params[:user_id], params[:gossip_id]), notice: "The comment has been deleted correctly"
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
    
end
