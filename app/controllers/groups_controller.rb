class GroupsController < ApplicationController

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
  begin
    @group.pic = params[:group][:pic]
    if @group.save
      redirect_to @group, notice: 'File was successfully uploaded.'
    else
      redirect_to @group, alert: 'There was a problem uploading your file.'
    end
  rescue NoMethodError
    redirect_to @group, alert: 'Please select a file.'
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
