class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new
    end
  end




  private

  def find_workout 
    @workout = Workout.find_by_id(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :sets, :reps)
  end




end
