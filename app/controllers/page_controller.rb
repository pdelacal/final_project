class PageController < ApplicationController
  def friends
  end

  def search
    @users = User.where "name LIKE ?", "%#{params[:term]}%"
    @listings = Listing.where "city LIKE ?", "%#{params[:term]}%"
    # @results = users + listings
  end
end
