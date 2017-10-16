class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to group_path(comment_params[:group_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :group_id)
  end

end
