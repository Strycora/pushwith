class UserGroupsController < ApplicationController
  before_action :find_user_group, only: [:destroy]

  def new
    @user_group = UserGroup.new
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