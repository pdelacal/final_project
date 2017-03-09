class ListingphotosController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @photos = @listing.listingphotos
  end

  def new
    if current_user.listing.listingphotos.count >= 12
      respond_to do |format|
      format.html { redirect_to listing_path(current_user.listing.id), notice: 'You may only upload twelve photos.' }
    end
    else
      @photo = Listingphoto.new
    end
  end

  def edit
    @listing = Listing.find_by(params[:id])
    @photos = @listing.listingphotos
  end

# post
  def create
    @photo = Listingphoto.new(photo_params)
    current_user.listing.listingphotos << @photo
    respond_to do |format|
      if @photo.save!
        format.html { redirect_to listing_path(current_user.listing.id), notice: 'Image upload successful.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @listing = Listing.find_by(params[:id])
    @photos = @listing.photos
    respond_to do |format|
      if @photos.save!
        format.html { redirect_to listing_path(current_user.listing.id), notice: 'Image upload successful.' }
        format.json { render :show, status: :created, location: @photo }

      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    photo = Listingphoto.find(params[:id])
    photo.destroy
    respond_to do |format|
      format.html { redirect_to listingphoto_path, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:listingphoto).permit(:photo)
      # params.require(:listingphoto).permit(photo: [])
    end

end
