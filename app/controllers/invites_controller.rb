class InvitesController < ApplicationController

  def create
    set_recipient_id
    @invite = Invite.create(invite_params)

    if @invite.errors.any?
      @invite.errors.full_messages
    else
      redirect_to Group.find(invite_params[:group_id]), notice: 'Invitation sent'
    end

  end

  def accept
    @invite = Invite.find(params[:invite_id])
    @group = Group.find(@invite.group_id)
    @group.users << current_user
    @invite.destroy
    redirect_to @group
  end

  private

  def set_recipient_id
    @user = User.find_by_email(invite_params.fetch(:email))
    if @user
      invite_params[:recipient_id] = @user.id
    else
      redirect_to Group.find(invite_params[:group_id]), alert: 'User doesn\'t exist'
    end
  end

  def invite_params
    @invite_params ||= params.require(:invite).permit(:group_id, :sender_id, :recipient_id, :email)
  end

end
