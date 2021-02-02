class WorkoutsController < ApplicationController
  before_action :find_workout_group, only: [:index, :new, :show, :create, :edit]
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_workout_group_not_found, only: [:index, :show, :edit, :update, :destroy]
  before_action :redirect_if_workout_not_found, only:[:show, :edit, :update, :destroy]
  before_action :redirect_if_not_in_group, only:[:edit, :update, :destroy]

 

  def new
      @workout = @workout_group.workouts.build
      redirect_if_not_in_group and return
      render :new
    
   # @workout = Workout.new
  end

  def create
   # @workout = @workout_group.workouts.build(workout_params)
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_group_workouts_path
    else
      #flash.now[:error] = @workout.errors.full_messages
      render :new
    end
  end

  def index
    if @workout_group
      @workouts = @workout_group.workouts
    else
      redirect_to workout_groups_path
    end

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
   # flash[:notice] = "#{@workout.name} was deleted."
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
      @workout_group = WorkoutGroup.find_by(id: params[:workout_group_id])
  end

  def redirect_if_workout_not_found
    if !@workout
      flash[:error] = ["Workout not found."]
      redirect_to workout_group_workouts_path
    end
  end

  def redirect_if_workout_group_not_found
    if (@workout && !@workout.workout_group) || !@workout_group
      flash[:error] = ["Workout Group not found."]
      redirect_to workout_groups_path
    end
    
  end

  def redirect_if_not_in_group
    if !@workout.workout_group.users.include?(current_user)
      flash[:error] = ["You are not in #{@workout.workout_group.name}"]
      redirect_to workout_group_workouts_path
    end
  end
      

end
