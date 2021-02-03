class SessionsController < ApplicationController
  def welcome
  end
  
  def new 
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to workout_groups_path
    else
      flash.now[:error] = ["Invalid Username Or Password"]
      render :new
    end
  end

  def destroy 
    session.clear
    redirect_to root_path
  end

  def google 
    @user = User.find_or_create_by(username: auth['info']['name']) do |user|
      user.password = SecureRandom.hex(10)
    end
    if @user && @user.id
      login_user
      redirect_to workout_groups_path
    else
      redirect_to "/login"
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end




end
