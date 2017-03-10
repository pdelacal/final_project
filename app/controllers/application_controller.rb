class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def user
    @user = User.new
  end
  helper_method :user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def other_users
    if current_user
      @other_users = User.where.not(id: current_user.id)
    else
      @other_users = User.all
    end
  end
  helper_method :other_users

end
