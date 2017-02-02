class MigrainesController < ApplicationController

  def index
    @migraines = Migraine.all
  end

end
