class UsersController < ApplicationController

  def new
  end
  
  def create
    @user = User.new(first_name: params[:first_name], email: params[:email])
    if @user.save
      redirect_to user_gossips_path(@user.id)
    else
      render root
  end

end