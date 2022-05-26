class GroupsController < ApplicationController
  def index
    @current_user = current_user
  end

  def new
    @group = Group.new
  end

  def create
    group = current_user.groups.new(group_params)

    if group.save
      redirect_to groups_path
      flash[:success] = 'Category was created!'
    else
      redirect_to new_group_path
      flash[:error] = 'Category wasn\'t created!!!'
    end
  end

  private

  def group_params
    params.require(:groups).permit(:name, :icon)
  end
end
