class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end


end
