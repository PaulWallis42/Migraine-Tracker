class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    if user_signed_in?
      user = User.find(current_user.id)
      user.foods.create(food_params)
    end
    redirect_to '/migraines'
  end

  private

  def food_params
    params.permit(:name, :food_quant, :phen_quant)
  end

end
