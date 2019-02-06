class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(title: params[:title], content: params[:content], author_id: params[:user_id])
    if @user.save
      redirect_to user_gossips_path(User.all.sample.id)
    else
      render "new"
    end
  end

end