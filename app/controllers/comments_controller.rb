class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to group_path(comment_params[:group_id])
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_back fallback_location: root_path 
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_back fallback_location: root_path 
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :group_id)
  end

end
