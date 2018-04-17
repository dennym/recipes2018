class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # if you want to build a method that you are only going to use in the views(navigation, forms etc) then you can use helpers(application_helper).
  # However application_controller, every method we build here will be available to all of our controller and we are going to use these methods to our controllers as well.
  # And then we will add helper method and identify those methods as helper methods, so they can be available in the views as well
  # So we can do two things at once, like below.

  helper_method :current_user, :logged_in?

  def current_user
    #only if a user in logged in (if session[:user_id]) and this is stored in my browser cookie, then grap the user_id from the session hash
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Here the logged_in? method should return a boolean value (as indicated by convention by the ? character).
    # The internal logic it uses to decide this value is by checking to see if the current_user variable is set.
    # If it is set, it will evaluate to true in a boolean context. If not, it will evaluate as false.
    # The double negation forces the return value to be a boolean.
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
