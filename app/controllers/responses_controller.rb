class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def create
    current_user.responses << Response.new(response_params)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
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
