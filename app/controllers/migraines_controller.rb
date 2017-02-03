class MigrainesController < ApplicationController

  def index
      #@migraines = Migraine.all
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
      user.migraines.create(migraine_params)
    end
    redirect_to '/migraines'
  end



  private

  def migraine_params
    params.require(:migraine).permit(:date, :severity)
  end

end
