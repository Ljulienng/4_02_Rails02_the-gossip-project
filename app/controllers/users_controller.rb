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
    @user = User.new(new_user)
    if @user.save
      redirect_to user_gossips_path(User.all.sample.id)
    else
      render "new"
    end
  end

  private

  def new_user
    params.require(:user).permit(:first_name, :last_name, :age, :description, :city_id)
  end

end