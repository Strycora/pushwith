class UserGroupsController < ApplicationController
  before_action :find_user_group, only: [:show, :edit, :update, :destroy]

  def index
    @user_groups = UserGroup.all
  end

  # def show
  # end

  def new
    @user_group = UserGroup.new
    # @user_group.user_id = current_user.user_id
  end

  def create
    @user_group = UserGroup.new(user_group_params)
    if @user_group.save
      redirect_to workout_groups_path
    else
      flash.now[:error] = @user_group.errors.full_messages
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   # if @user_group.update(user_group_params)
  #   #   redirect_to user_group_path 
  #   # else
  #   #   flash.now[:error] = @user_group.errors.full_messages
  #   #   render :edit
  #   # end
  # end

  def destroy
    @user_group.destroy
    redirect_to workout_groups_path
  end


  private

  def find_user_group
    @user_group = UserGroup.find_by_id(params[:id])
  end

  def user_group_params
    params.require(:user_group).permit(:mantra, :workout_group_id, :user_id)
  end
end