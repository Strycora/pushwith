class ApplicationController < ActionController::Base

  helper_method :user_signed_in?, :current_user

  def user_signed_in?
    !!session[:user_id]
  end

  def fallback
    redirect_to root_path
  end

  def current_user
    User.find_by_id(session[:user_id]) if user_signed_in?
  end

  def login_user
    session[:user_id] = @user.id
  end

  def redirect_if_not_logged_in
    if  !user_signed_in?
      flash[:error] = ["You must be logged in to do that"]
      redirect_to root_path
    end
  end

end
