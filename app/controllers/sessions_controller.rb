class SessionsController < ApplicationController

  skip_before_action :redirect_if_not_logged_in

  def home
    
  end

  def new
    if logged_in?
      redirect_to projects_path
    end
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id

      redirect_to projects_path

    else
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to projects_path     #projects/index page
      else
        redirect_to login_path  #does not allow for field w/errors and does not keep data.
      end
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
