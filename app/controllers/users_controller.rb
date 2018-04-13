class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

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
    @user_recipes = @user.recipes.paginate(page: params[:page], per_page: 5) # here with the instance variable @user_recipes we are going to collect the recipes base on pagination(5 at a time), and then apply in to show page
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


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "Chef and all associated recipes have been deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
