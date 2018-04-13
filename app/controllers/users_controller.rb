class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name} to the app!"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def show
    @user =  User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your acount was updated successfully"
      redirect_to @user
    else
      render "edit"
    end
  end

  def index
    @user = User.all
  end

  def destroy

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
