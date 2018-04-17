class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]


  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # we set session[:user_id] = @user.id so when this user logged_in? to strore his id in cookies and staying logged in
      flash[:success] = "Welcome #{@user.name} to the app!"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def show
    @user_recipes = @user.recipes.paginate(page: params[:page], per_page: 5) # here with the instance variable @user_recipes we are going to collect the recipes base on pagination(5 at a time), and then apply in to show page
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your acount was updated successfully"
      redirect_to @user
    else
      render "edit"
    end
  end


  def destroy
    if !@user.admin?
      @user.destroy
      flash[:danger] = "Chef and all associated recipes have been deleted"
      redirect_to users_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own account"
        redirect_to users_path
      end
    end

    def require_admin
      if logged_in? && !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end

end
