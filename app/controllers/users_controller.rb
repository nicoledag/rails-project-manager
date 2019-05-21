class UsersController < ApplicationController

  skip_before_action :redirect_if_not_logged_in

  def new
    if logged_in?
      redirect_to projects_path
    else
      @user = User.new
    end
  end


  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_path     #projects/index page
    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
