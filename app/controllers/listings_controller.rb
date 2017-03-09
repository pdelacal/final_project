class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @photos = current_user.listing.listingphotos
    message = "photos is nil"
    raise RuntimeError.new message unless @photos
  end

  # GET /listings/new
  def new
    if current_user.listing
      respond_to do |format|
      format.html { redirect_to listing_path(current_user.listing.id), notice: 'You may only have one listing.' }
    end
    else
    @listing = Listing.new
    @photo = Listingphoto.new
    end
  end

  # GET /listings/1/edit
  def edit
    @listingphoto = Listingphoto.new
    # @listing = current_user.listing.destroy
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    respond_to do |format|
      if @listing.save!
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    current_user.listing = Listing.new(listing_params)
    @listing = Listing.find_by(user_id: current_user.id)

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
    #
    # def set_user
    #   @user = current_user
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(
        :address,:rent,:amenities,:description,:apt_number,:city,
        :state,:zipcode,:deposit,:move_in_date,:stay_duration,:in_unit_washer,
        :wifi_included,:utilities_included,:furnished,:elevator,:doorman,
        :air_conditioning,:heating,:month_to_month,:gym,:tv,:own_closet,
        :pet_friendly,:private_bathroom,:kitchen,:no_smoking,:no_pets,
        :no_loud_music,:no_overnight_guests,:no_drugs,:no_late_nights,
        :no_drinking,:no_house_guests, :photo
      )
    end
end
