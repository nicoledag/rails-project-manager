class SessionsController < ApplicationController

  def home
  end

  def new

  end

  def create
    # raise params.inspect

    @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to projects_path     #projects/index page
    else
      redirect_to login_path  #does not allow for field w/errors and does not keep data.
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
