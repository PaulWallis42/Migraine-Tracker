class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    if user_signed_in?
      user = User.find(current_user.id)
        if user.foods.any?
          old_quant = user.foods.last.phen_run_total
          new_food = user.foods.new(food_params)
          new_food.phen_run_total = params[:phen_quant].to_f + old_quant
          new_food.save
        else
          new_food = user.foods.new(food_params)
          new_food.phen_run_total = params[:phen_quant]
          new_food.save
        end
    end
    redirect_to '/migraines'
  end

  private

  def food_params
    params.permit(:name, :food_quant, :phen_quant)
  end

end
