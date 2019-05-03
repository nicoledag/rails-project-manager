class SessionsController < ApplicationController

  def home
  end

  def new

  end

  def create
    # raise params.inspect

    # <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"qzganR2BGNc2YzseSO3aAEnn5ggjtmGsc6z0CGI3hR02lKezYOYCCpYmCYF/i/njyZzXSpbXP0P4YuWPcGgo1w==",
    # "username"=>"nicole",
    # "user"=>{"email"=>"nnardella@gmail.com"},
    # "password"=>"1234",
    # "commit"=>"Log In", "controller"=>"sessions", "action"=>"create"} permitted: false>

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
