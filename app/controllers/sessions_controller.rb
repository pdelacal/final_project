class SessionsController < ApplicationController
  def new
      @user = User.new
      # redirect_to root_path
      # @session = Session.new
  end

  def create
    auth = request.env["omniauth.auth"]
    @user = User.find_by_email(params[:email])
# If the user exists AND the password entered is correct.
    if auth.nil?
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        # If user's login doesn't work, send them back to the login form.
        render :new
      end
    elsif auth['provider'] == "facebook"
      user = User.find_by(email: auth['info']['email']) ||
        User.create_from_facebook(auth)
      user.facebook_id = auth['uid']
      user.save
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end
