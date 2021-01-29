class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

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
      flash.now[:error] = @workout.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path 
    else
      flash.now[:error] = @workout.errors.full_messages
      render :edit
    end
  end

  def destroy
    @workout.destroy
    flash[:notice] = "#{@workout.name} was deleted."
    redirect_to workouts_path
  end






  private

  def find_workout 
    @workout = Workout.find_by_id(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :sets, :reps)
  end
end
