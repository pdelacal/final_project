class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @user = current_user
  end

  def edit
  end

  def create
    # @user.id = current_user.id
    current_user.responses << Response.new(response_params)
    # @user = User.find(current_user.reponses.user_id)
    @response = current_user.responses.last

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response.user, notice: 'Listing was successfully edited.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = current_user
  end
end

private
  def response_params
    params.permit(
      :age_early_20s, :age_late_20s, :age_30s, :age_40s_older, :gender,
      :budget_min, :budget_max, :move_in_date, :duration, :pet_dog, :pet_cat,
      :pet_other, :like_pet_dog, :like_pet_cat, :like_pet_other, :wakeup,
      :bedtime, :work, :work_from_home, :overnight_guests, :relationship,
      :relationship_type, :smoking, :messy, :environment, :party, :communicator,
      :friends_over, :drink, :visitors
    )
  end
