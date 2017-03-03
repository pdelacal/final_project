class PageController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to register_path
    else
      @users = User.where.not(id: current_user.id)
    end
  end
end
