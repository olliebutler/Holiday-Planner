class InvitesController < ApplicationController

  def new
    @invie = Invite.new
  end
  def create
    @i = params[:invite]
    @user = User.find_by_email(@i[:email])
    @invite = Invite.new
    @invite.group_id = params[:group_id]
    @invite.sender_id = current_user.id
    @invite.recipient_id = @user.id
    @invite.email = params[:email]
    @invite.save
    redirect_to Group.find(params[:group_id])
  end
end
