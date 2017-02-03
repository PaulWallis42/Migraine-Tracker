class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    Food.create(food_params)
    redirect_to '/migraines'
  end

  private

  def food_params
    params.require(:food).permit(:name, :food_quant, :phen_quant)
  end

end
