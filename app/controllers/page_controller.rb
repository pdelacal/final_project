class PageController < ApplicationController
  def friends
  end

  def search
    # @results = "REGEXP_MATCHES(city, ?)", "#{params[:term.split(",").first]}"
    if [:term]
    @listings = Listing.where("city LIKE ?", "%#{params[:term].split(",").first}%") 
  end
    # @users = User.where "name LIKE ?", "%#{params[:term]}%"
    # Listing.where("address LIKE ?", "%#{params[:term]}%")
    # unless @listings.nil? || @users.nil?
      # @results = @users + @listings
      # @listings.each do |listing|
      #   @users = User.where(id: listing.user_id)
      # end
    # end
  end
end
