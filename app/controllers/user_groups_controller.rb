class UserGroupsController < ApplicationController
  def destroy
    @user_group = UserGroup.find_by(user_group_params)
    if @user_group.destroy
      redirect_to Group.find(user_group_params[:group_id]), notice: 'User removed'
    else
      redirect_to :back
    end
  end



  private

  def user_group_params
    params.require(:user_group).permit(:group_id, :user_id)
  end
end
