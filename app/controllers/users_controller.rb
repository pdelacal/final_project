class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :set_avatar,
    :request_friend, :add_friend, :cancel_request, :ignore_request, :remove_friend]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def request_friend #send request
    # user = User.find(params[:id])
    user = @user
    current_user.requests_to << @user
    @user.requests_from << current_user
    redirect_to @user
  end

  def add_friend #created association when confirmed
    # user = User.find(params[:id])
    user = @user
    current_user.friends << user
    current_user.requests_from.delete(user)
    user.friends << current_user
    user.requests_to.delete(current_user)
    redirect_to user
  end

  def cancel_request #cancel association
    # user = @user
    current_user.requests_to.delete(@user)
    @user.requests_from.delete(current_user)
    redirect_to @user
  end

  def ignore_request #ignore send request association
    user = @user
    current_user.requests_from.delete(user)
    user.requests_to.delete(current_user)
    redirect_to user
  end

  def remove_friend #remove association
    user = @user
    current_user.friends.delete(user)
    user.friends.delete(current_user)
    redirect_to user
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to questionnaire_path
    else
      render :new
    end

  #   if @user.name.empty?
  #     flash[:notice] = "Name cannot be blank."
  #     # redirect_to register_path
  #  elsif
  #    @user.password.nil?
  #    flash[:notice] = "Password can't be blank."
  #   #  redirect_to register_path
  #  elsif
  #    @user.password != @user.password_confirmation
  #    flash[:notice] = "Passwords don't match."
  #   #  redirect_to register_path
  #  elsif @user.save
  #    session[:user_id] = @user.id
  #    redirect_to questionnaire_path
  #  else
  #    flash[:notice] = "Email is already registered."
  #    redirect_to root_path
  #   end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_user
    if params['user'] && params['user']['avatar']
      @user.avatar = params['user']['avatar']
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def avatar
    set_user
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user
    if @user.listing && @user.listing.listingphotos.last
      @user.listing.listingphotos.destroy_all
    end
    if @user.listing
      @user.listing.destroy
    end
    if @user.responses.last
      @user.responses.destroy_all
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to logout_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_avatar
    set_user
    @user.avatar.destroy
    @user.avatar_file_name = nil
    @user.avatar_content_type = nil
    @user.avatar_file_size = nil
    redirect_to @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
