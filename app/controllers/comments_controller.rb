class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:edit, :destroy]

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

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end

    def authorized
      unless current_user == @comment.author
      flash[:danger] = "Don't touch other people's sh*t!"
      redirect_to user_gossip_comment_path(params[:user_id], params[:gossip_id], params[:id])
      end
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
    
end
