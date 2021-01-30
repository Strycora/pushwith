class WorkoutGroupsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workout_groups = WorkoutGroup.all
  end

  def show
  end

  def new
    @workout_group = WorkoutGroup.new
  end

  def create
    @workout_group = WorkoutGroup.new(workout_group_params)
    if @workout.save
      redirect_to workout_groups_path
    else
      flash.now[:error] = @workout_group.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @workout_group.update(workout_group_params)
      redirect_to workout_group_path 
    else
      flash.now[:error] = @workout_group.errors.full_messages
      render :edit
    end
  end

  def destroy
    @workout_group.destroy
    flash[:notice] = "#{@workout_group.name} was deleted."
    redirect_to workouts_path
  end






  private

  def find_workout_group 
    @workout_group = WorkoutGroup.find_by_id(params[:id])
  end

  def workout_params
    params.require(:workoutgroup).permit(:name)
  end
end
