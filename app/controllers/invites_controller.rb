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
    @invite.email = current_user.email
    @invite.save
    redirect_to Group.find(params[:group_id])
  end

  def accept
    @invite = Invite.find(params[:invite_id])
    @group = Group.find(@invite[:group_id])
    @group.users << current_user
    @invite.destroy
    redirect_to @group
  end
  
end
