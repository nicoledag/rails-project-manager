class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  #authenticity_token which prevents again CSRF (Cross Site Request Forgery).
  # include ApplicationHelper

  before_action :redirect_if_not_logged_in

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


  def logged_in?
      !!current_user
      # A "double-bang operator" (!!) will return true or false based on whether a value is truthy or falsey to begin with.
  end

  def redirect_if_not_logged_in
    if !logged_in?
        redirect_to login_path
      end
  end

  helper_method :current_user #so current_user can be used in views.

end
