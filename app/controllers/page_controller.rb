class PageController < ApplicationController
  def friends
  end

  def search
    @users = User.where "name LIKE ?", "%#{params[:term]}%"
    @listings = Listing.where("city LIKE ?", "%#{params[:term]}%")
    Listing.where("address LIKE ?", "%#{params[:term]}%")
    @results = @users + @listings
    @listings.each do |listing|
      @users = User.where(id: listing.user_id)
    end
  end
end
