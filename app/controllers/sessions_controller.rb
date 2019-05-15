class SessionsController < ApplicationController

  skip_before_action :redirect_if_not_logged_in

  def home #root path

  end

  def new #form tag so no instance varible.
    if logged_in?
      redirect_to projects_path
    end
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      set_session_and_redirect

    else
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        set_session_and_redirect
      else
        redirect_to login_path  #does not allow for field w/errors and does not keep data.
      end
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def set_session_and_redirect
    session[:user_id] = @user.id
    redirect_to projects_path
  end




end
