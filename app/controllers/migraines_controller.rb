class MigrainesController < ApplicationController

  def index
    @migraines = Migraine.all
  end

  def new
    @migraine = Migraine.new
  end

  def create
    Migraine.create(migraine_params)
    redirect_to '/migraines'
  end



  private

  def migraine_params
    params.require(:migraine).permit(:date, :severity)
  end

end
