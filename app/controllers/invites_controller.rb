class InvitesController < ApplicationController

  def new
    @invie = Invite.new
  end
  def create
    @user = User.find_by_email(params[:email])
    @invite = Invite.new
    @invite.group_id = params[:group_id]
    @invite.sender_id = current_user
    @invite.recipient_id = @user
    @invite.email = params[:email]
    @invite.save
    redirect_to group_path(@group)
  end
end
