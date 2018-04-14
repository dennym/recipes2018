class SessionsController < ApplicationController

  def new
    #just render the new form
  end

  def create #it handle the submit action(post)
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])      #if user user if it's valid
      session[:user_id] = user.id   #login mean storing  the encrypted user_id in the session hash(cookie), so i set the session[:user_id] to this user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user
    else
      flash.now[:danger] = "There was something wrong with your login information" # with flash.now it will just display on the same page and then disappear
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end

# How do i simulate logging in? The encrypted id is stored in the session hash in your browser's cookie.
# Setting the session[:user_id] used here accomplishes this.
