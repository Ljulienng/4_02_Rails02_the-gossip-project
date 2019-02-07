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
    @user.city_id = params[:city_id]
    if @user.save
      redirect_to "/"
      puts @user
    else
      render "new"
    end
  end

  private

  def new_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :age, :description)

  end

end