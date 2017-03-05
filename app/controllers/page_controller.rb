class PageController < ApplicationController
  def index
    if current_user
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
  end
end
