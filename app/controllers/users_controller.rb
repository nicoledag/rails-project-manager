class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    # raise params.inspect
    @user = User.create(user_params)
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
