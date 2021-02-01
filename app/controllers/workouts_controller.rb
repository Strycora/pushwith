class WorkoutsController < ApplicationController
  before_action :find_workout_group, only: [:index, :new, :show, :create, :edit]
  before_action :find_workout, only: [:show, :edit, :update, :destroy]

 

  def new
      @workout = @workout_group.workouts.build
      #render :new_workout_group_workout
      render :new
    
   # @workout = Workout.new
  end

  def create
   # @workout = @workout_group.workouts.build(workout_params)
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_group_workouts_path
    else
      flash.now[:error] = @workout.errors.full_messages
      render :new
    end
  end

  def index
    # if @workout_group
    @workouts = @workout_group.workouts
    # end
    #@workouts = Workout.all
  end

  def show
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_group_workout_path 
    else
      flash.now[:error] = @workout.errors.full_messages
      render :edit
    end
  end

  def destroy
    @workout.destroy
    flash[:notice] = "#{@workout.name} was deleted."
    redirect_to workout_group_workouts_path
  end


  private

  def find_workout 
    @workout = Workout.find_by_id(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :sets, :reps, :workout_group_id)
  end  
  
  def find_workout_group
    @workout_group = WorkoutGroup.find_by(params[:workout_group_id])
  
  end
      

end
