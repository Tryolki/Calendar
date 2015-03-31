class CommentOfCommentsController < ApplicationController
  def create
    @user = User.where(:id => current_user.id)
    @comment = Comment.find(params[:comment_id])
    @comment_of_comment = @comment.comment_of_comments.create(comment_params)
    respond_to do |format|
      format.html {redirect_to image_date_path(@comment.image_date_id)}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment_of_comment = @comment.comment_of_comments.find(params[:id])
    @comment_of_comment.destroy
    respond_to do |format|
      format.html {redirect_to image_date_path(@comment.image_date_id)}
      format.js
    end

  end
  private
  def comment_params
    params.require(:comment_of_comment).permit(:content, :user_name, :comment_id,:user_id)
  end
end
