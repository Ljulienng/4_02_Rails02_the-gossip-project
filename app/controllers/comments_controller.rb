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
    @comment = Comment.new(content: params[:content], author: User.find(params[:user_id]), gossip: Gossip.find(params[:gossip_id]))
    puts params[:content]
    if @comment.save
      redirect_to user_gossip_comments_path(params[:user_id], params[:gossip_id])
    else
      render "new"
    end
  end

  def update
    
  end

  def destroy
    @comment.destroy
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
    
end
