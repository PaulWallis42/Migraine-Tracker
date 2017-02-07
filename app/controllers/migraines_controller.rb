class MigrainesController < ApplicationController

  def index
      if user_signed_in?
        user = User.find(current_user.id)
        @migraines = user.migraines
      end
  end

  def new
    @migraine = Migraine.new
  end

  def create
    if user_signed_in?
      user = User.find(current_user.id)
      running_phen_from_food = user.foods.last.phen_run_total
      new_migraine = user.migraines.new(migraine_params)
      new_migraine.phen_level = running_phen_from_food
      new_migraine.save
      food_record = user.foods.last
      food_record.phen_run_total = 0
      food_record.save
    end
    redirect_to '/migraines'
  end



  private

  def migraine_params
    params.require(:migraine).permit(:date, :severity)
  end

end
