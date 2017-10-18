class GroupsController < ApplicationController


# def invite
  # @invite = Invite.new
  # @invite.sender_id = current_user.id
  # @invite.group_id = params[:group_id]
  # @invite.recipient_id = User.find_by_email(params[:email])
  # if @invite.save
  #   redirect_to @group
  # else
  #   redirect_to current_user
  # end
# end

def index
  @groups = current_user.groups
end

def show
  @group = Group.find(params[:id])
end

def new
  @group = Group.new
end

def edit
  @group = Group.find(params[:id])
end

def uploadpic
  @group = Group.find(params[:id])
  @group.pic = params[:group][:pic]
  if @group.save
    redirect_to @group, notice: 'File was successfully uploaded.'
  else
    redirect_to @group, alert: 'There was a problem uploading your file.'
  end
end

def create
@group = Group.new(group_params)

@group.users << current_user

if @group.save
  redirect_to @group
else
  render 'new'
end

end

def update
  @group = Group.find(params[:id])

  if @group.update(group_params)
    redirect_to @group
  else
    render 'edit'
  end
end

def destroy
  @group = Group.find(params[:id])
  @group.destroy

  redirect_to groups_path
end

private

def group_params
  params.require(:group).permit(:title, :body)
end

end
