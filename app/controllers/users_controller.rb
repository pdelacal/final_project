class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def request_friend #send request
    user = User.find(params[:id])
    current_user.requests_to << user
    user.requests_from << current_user
    redirect_to root_path
  end

  def add_friend #created association when confirmed
    user = User.find(params[:id])
    current_user.friends << user
    current_user.requests_from.delete(user)
    user.friends << current_user
    user.requests_to.delete(current_user)
    redirect_to root_path
  end

  def cancel_request #cancel association
  user = User.find(params[:id])
  current_user.requests_to.delete(user)
  user.requests_from.delete(current_user)
  redirect_to root_path
end

def ignore_request #ignore send request association
  user = User.find(params[:id])
  current_user.requests_from.delete(user)
  user.requests_to.delete(current_user)
  redirect_to root_path
end

  def remove_friend #remove association
    user = User.find(params[:id])
    current_user.friends.delete(user)
    user.friends.delete(current_user)
    redirect_to root_path
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.name.empty?
      flash[:notice] = "Name cannot be blank."
      redirect_to register_path
   elsif
     @user.password.nil?
     flash[:notice] = "Password can't be blank."
     redirect_to register_path
   elsif
     @user.password != @user.password_confirmation
     flash[:notice] = "Passwords don't match."
     redirect_to register_path
   elsif @user.save
     session[:user_id] = @user.id
     redirect_to root_path
   else
     flash[:notice] = "Email is already registered."
     redirect_to root_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
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
