class WorkoutGroupsController < ApplicationController
  before_action :find_workout_group, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_found, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in, only: [:new, :edit, :update, :destroy]
  before_action :redirect_if_not_in_group, only: [:edit, :update, :destroy]

  def index
    if params[:query]
      @workout_groups = WorkoutGroup.search(params[:query])
    else
      @workout_groups = WorkoutGroup.all
    end
  end

  def show
    if @workout_group
      @user_groups = @workout_group.user_groups.all
    else
      redirect_to workout_groups_path
    end
  end

  def new
    @workout_group = WorkoutGroup.new
    3.times { @workout_group.workouts.build } 
  end

  def create
    @workout_group = WorkoutGroup.new(workout_group_params)
    if @workout_group.save

      redirect_to workout_groups_path
    else
      #flash.now[:error] = @workout_group.errors.full_messages
      render :new
    end
  end

  def edit
    

  end

  def update
    if @workout_group.update(workout_group_params)
      redirect_to workout_group_path 
    else
      #flash.now[:error] = @workout_group.errors.full_messages
      render :edit
    end
  end

  def destroy
    
    @workout_group.user_groups.destroy
    @workout_group.destroy
    flash[:notice] = "#{@workout_group.name} was deleted."
    redirect_to workout_groups_path
  end


  private

  def find_workout_group 
    @workout_group = WorkoutGroup.find_by_id(params[:id])
  end

  def workout_group_params
    params.require(:workout_group).permit(:name, :user_groups, workouts_attributes: [:name, :sets, :reps], user_groups_attributes: [:user_id, :mantra])
  end

  

  def redirect_if_not_in_group
    if !@workout_group.users.include?(current_user)
      flash[:error] = ["You need to be in the group to do that."]
      redirect_to workout_group_path
    end
  end


  def redirect_if_not_found
    if !@workout_group
      flash[:error] = ["Workout group not found"]
      redirect_to workout_groups_path
    end
  end
end
