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
      #They logged in via OAuth.

      #The person's 100% trusted coming from Github
      # raise params.inspect
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(:email => oauth_email)
        #I've seen person before, just log them in because I know they didn't spoof email.
        session[:user_id] = user.id
        redirect_to projects_path
      else
        #I know who the person, oauth email, but this is the first time they come to my application.
        oauth_username = request.env["omniauth.auth"]["info"]["nickname"]
        user = User.new(:email => oauth_email, :username => oauth_username, :password => SecureRandom.hex)
        if user.save
          session[:user_id] = user.id
          redirect_to projects_path
        else
          redirect_to login_path
        end
      end

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
